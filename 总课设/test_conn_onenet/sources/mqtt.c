#include "mqtt.h"
#include "tcp.h"
#include "utils.h"

static unsigned char MQTT_CONENCT_BUF[200];
static unsigned char MQTT_SUB_BUF[200];
static unsigned char MQTT_SEND_BUF[200];
static unsigned char MQTT_REV_BUF[200];


void mqtt_init()
{
	tcp_init(); 
	printf("[CONN INFO] \n");
	printf(" --- IP Addrress:  %s\n",IP_ADDR);
	printf(" --- Port number: %d\n",PORT);
	printf(" --- product id:  %s\n",PRODUCT_ID);
	printf(" --- device name: %s\n\n",DEVICE_NAME);
}


int mqtt_connect()
{
	// 封装报文
	int len_conn = mqtt_pack_conn_data();
	// TCP发送-接收
	tcp_send(MQTT_CONENCT_BUF, len_conn);
	tcp_rev(MQTT_REV_BUF, 200);
	// 解封装
	if(mqtt_unpack_conn_data(MQTT_REV_BUF, 4)==0)
		printf("MQTT connect successful!\n");
	else
		printf("ERROR: MQTT connect failed!\n");
}


int mqtt_subscribe()
{
	// 封装报文
	int len_sub = mqtt_pack_sub_data();
	// TCP发送-接收
	tcp_send(MQTT_SUB_BUF, len_sub);
	tcp_rev(MQTT_REV_BUF, 200);
	// 解封装
	if(mqtt_unpack_sub_data(MQTT_REV_BUF, 5)==0)
		printf("MQTT topic subcribed!\n");
	else
		printf("ERROR: MQTT subcribe failed!\n");
}


int mqtt_publish(unsigned char *msg_buf)
{
	// 封装报文
	int len_pub = mqtt_pack_pub_data(msg_buf);
	// TCP发送
	tcp_send(MQTT_SEND_BUF, len_pub);
}


int mqtt_pack_conn_data()
{
	memset(MQTT_CONENCT_BUF,0,sizeof(MQTT_CONENCT_BUF));

	unsigned char len_conn = 0;
	unsigned char len_device_name = strlen(DEVICE_NAME);
	unsigned char len_product_id = strlen(PRODUCT_ID);
	unsigned char len_auth_info = strlen(AUTH_INFO);

	/* Fixed Header */
	//MQTT Packet Type
	MQTT_CONENCT_BUF[0] = 0X10;
	len_conn += 1;

	//Remaining length =len(Variable Header + Payload)
	int len_remain = len_device_name + len_product_id + len_auth_info + 16;
	len_conn += get_remaining_length(&MQTT_CONENCT_BUF[1], len_remain);

	/* Variable Header */
	//Protocol name length
	MQTT_CONENCT_BUF[len_conn++] = 0X00;
	MQTT_CONENCT_BUF[len_conn++] = 0X04;

	//Protocol name
	MQTT_CONENCT_BUF[len_conn++] = 0X4D;
	MQTT_CONENCT_BUF[len_conn++] = 0X51;
	MQTT_CONENCT_BUF[len_conn++] = 0X54;
	MQTT_CONENCT_BUF[len_conn++] = 0X54;//MQTT

	//Protocol Level
	MQTT_CONENCT_BUF[len_conn++] = 0X04;//protocol Level=4

	//Connect Flag
	MQTT_CONENCT_BUF[len_conn++] = 0XC2;//user=1 password=1 will=0 willRetain=0 willQos=0 clenSession=1 clenSession=0

	//KeepAlive
	MQTT_CONENCT_BUF[len_conn++] = 0X00;
	MQTT_CONENCT_BUF[len_conn++] = 0X3C;// keepAlive=0x003C (60)

	/* Payload */
	//Client Id Length
	MQTT_CONENCT_BUF[len_conn++] = (len_device_name>>8) & 0xff;
	MQTT_CONENCT_BUF[len_conn++] = len_device_name & 0xff;
	//Client Id
	str_cpy(&MQTT_CONENCT_BUF[len_conn], DEVICE_NAME, len_device_name);
	len_conn += len_device_name;

	//UserName Length
	MQTT_CONENCT_BUF[len_conn++] = (len_product_id>>8) & 0xff;
	MQTT_CONENCT_BUF[len_conn++] = len_product_id & 0xff;
	//UserName
	str_cpy(&MQTT_CONENCT_BUF[len_conn], PRODUCT_ID, len_product_id);
	len_conn += len_product_id;

	//UserPassword Length
	MQTT_CONENCT_BUF[len_conn++] = (len_auth_info>>8) & 0xff;
	MQTT_CONENCT_BUF[len_conn++] = len_auth_info & 0xff;
	//UserPassword
	str_cpy(&MQTT_CONENCT_BUF[len_conn], AUTH_INFO, len_auth_info);
	len_conn += len_auth_info;

	// print_hex(MQTT_CONENCT_BUF, len_conn);
	return len_conn;
}

int mqtt_pack_sub_data()
{
	memset(MQTT_SUB_BUF,0,sizeof(MQTT_SUB_BUF));

	int len_subscribe = 0;
	int len_sub_topic = strlen(DP_SUB_TOPIC);

	//MQTT Packet Type
	MQTT_SUB_BUF[0] = 0X82;
	len_subscribe += 1;

	//Remaining length = len(Variable Header + Payload)
	int len_remain = len_sub_topic + 5;
	len_subscribe += get_remaining_length(&MQTT_SUB_BUF[1], len_remain);

	/*Variable Header*/
	//Packet Identifier
	MQTT_SUB_BUF[len_subscribe++] = 0X00;
	MQTT_SUB_BUF[len_subscribe++] = 0X01;

	/*payload*/
	//topic length
	MQTT_SUB_BUF[len_subscribe++] = (len_sub_topic>>8) & 0xff;
	MQTT_SUB_BUF[len_subscribe++] = len_sub_topic & 0xff;
	//topic name
	str_cpy(&MQTT_SUB_BUF[len_subscribe], DP_SUB_TOPIC, len_sub_topic);
	len_subscribe += len_sub_topic;

	//QoS
	MQTT_SUB_BUF[len_subscribe++] = 0x00;

	// print_hex(MQTT_SUB_BUF, len_subscribe);
	return len_subscribe;
}

int mqtt_pack_pub_data(unsigned char *msg_buf)
{
	memset(MQTT_SEND_BUF,0,sizeof(MQTT_SEND_BUF));

	int len_publish = 0;
	int len_pub_topic = strlen(DP_PUB_TOPIC);
	int len_msg = strlen(msg_buf);

	/* Fixed Header */
	//MQTT Packet Type
	MQTT_SEND_BUF[0] = 0x30; //DUP=0, QoS=0, retain=0
	len_publish += 1;

	//Remaining length
	int len_remain = len_pub_topic + len_msg + 2;
	len_publish += get_remaining_length(&MQTT_SEND_BUF[1], len_remain);

	/* Variable Header */
	//topic length
	MQTT_SEND_BUF[len_publish++] = (len_pub_topic>>8) & 0xff;
	MQTT_SEND_BUF[len_publish++] = len_pub_topic & 0xff; 
	//topic
	str_cpy(&MQTT_SEND_BUF[len_publish], DP_PUB_TOPIC, len_pub_topic);
	len_publish += len_pub_topic;

	/* Payload */
	str_cpy(&MQTT_SEND_BUF[len_publish], msg_buf, len_msg);
	len_publish += len_msg;

	//print_hex(MQTT_SEND_BUF, len_publish);
	return len_publish;
}


int mqtt_unpack_conn_data()
{
	int ret = ((MQTT_REV_BUF[0]==0x20)? 0:-1);
	return ret;
}


int mqtt_unpack_sub_data()
{
	if(MQTT_REV_BUF[0]==0x90 && MQTT_REV_BUF[4]==0x00)
		return 0;
	else
		return -1;
}



/**
 * 剩余长度（Remaining Length）表示当前报文剩余部分的字节数，包括可变报头和负载的数据。
 * 剩余长度字段字节长度：最少1个字节，最多4个字节。
 */
int get_remaining_length(unsigned char *msg_buf, int len_msg_buf)
{
	int len_buf = 0;					// 对打包后的剩余长度进行计数
	int len_encoded = len_msg_buf;		// 被用于编码的remaining length
	for(int i=0; len_encoded>127; i++)
	{
		msg_buf[len_buf++] = len_encoded & 0x7f + 0x80;
		len_encoded = len_encoded>>7;
	}
	msg_buf[len_buf++] = (len_encoded) & 0x7f;
	return len_buf;
}
