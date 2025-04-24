#ifndef __MQTT_H
#define __MQTT_H

#define DEVICE_NAME     "MQTT3"
#define PRODUCT_ID      "H0u2E4Xr6e"
#define AUTH_INFO       "version=2018-10-31&res=products%2FH0u2E4Xr6e%2Fdevices%2FMQTT3&et=2524579200&method=md5&sign=R%2Fitpbm2loYoy%2B47%2FdoB0A%3D%3D"

#define DP_SUB_TOPIC    "$sys/H0u2E4Xr6e/MQTT3/dp/post/json/+"
#define DP_PUB_TOPIC    "$sys/H0u2E4Xr6e/MQTT3/dp/post/json"

void mqtt_init();

int mqtt_pack_conn_data();
int mqtt_pack_sub_data();
int mqtt_pack_pub_data(unsigned char *msg_buf);

int mqtt_unpack_conn_data();
int mqtt_unpack_sub_data();

int mqtt_connect();
int mqtt_subscribe();
int mqtt_publish(unsigned char *msg_buf);

int get_remaining_length(unsigned char *msg_buf, int len_msg_buf);

#endif

