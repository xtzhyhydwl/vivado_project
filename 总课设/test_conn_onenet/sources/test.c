/*
 * @Date: 2025-05-06 21:57:10
 * @LastEditors: xiayuan 1137542776@qq.com
 * @LastEditTime: 2025-05-06 21:57:12
 * @FilePath: \undefinedd:\zonghekechensheji\总课设\test_conn_onenet\sources\test.c
 */
#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include <time.h>   
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

#include "mqtt.h"

 double get_ult_len(int fd_ult)
 {
 	int len;
	int val[2] = {0,0};
 	char buffer[9];

 	len = read(fd_ult,buffer,sizeof(buffer)-1);
 	buffer[len] = '\0';
 	memcpy(val, buffer, len);
 	//printf("len: %d dis:%d state:%d\n",len,(int)val[0]/58,buffer[1]);

 	return (double)val[0]/58;
 }

 int get_pir_state(int fd_pir)
 {
 	int len;
 	int val[1] = {0};
 	char buffer[5];

 	len = read(fd_pir,buffer,sizeof(buffer)-1);
 	buffer[len] = '\0';
 	memcpy(val, buffer, len);

 	return val[0];
 }

typedef enum {
	IDLE = 0, 
	RECORDING,
	ALARM,
	END,
} state_t;

#define MAX_DIS 110
#define MIN_DIS 20
#define PIR_WINDOW 50
#define ULT_WINDOW 50
#define PIR_THRESHOLD 0.4

int start_count = 0;
int recording_count = 0;
int end_count = 0;
state_t STATE = IDLE;

double mean_filter_ult_buffer[ULT_WINDOW] = {0};

int mean_filter_index_ult = 0;
double pir_value_mean = 0;
double ult_value_mean = 0;
int alarm_count = 0;
int alarm_flag = 0;
double sitting_time = 0;

int mean_filter_index_pir = 0;
double mean_filter_pir_buffer[PIR_WINDOW] = {0};
double mean_filter_pir(int pir_value) {  //对PIR取值进行均值滤波
	if (pir_value < 0) { // 检查输入值是否有效
        pir_value = 0;
    }
	mean_filter_pir_buffer[mean_filter_index_pir] = pir_value;
	mean_filter_index_pir++;
	if (mean_filter_index_pir >= PIR_WINDOW) {
		mean_filter_index_pir = 0;
	}
	double sum = 0;
	for (int i = 0; i < PIR_WINDOW; i++) {
		sum += mean_filter_pir_buffer[i];
	}
	return (double)sum / PIR_WINDOW;
}

double mean_filter_ult(int ult_value) {  //对ult取值进行均值滤波
	if (ult_value < 0) { // 检查输入值是否有效
        ult_value = 0;
    }
	mean_filter_ult_buffer[mean_filter_index_ult] = ult_value;
	mean_filter_index_ult++;
	if (mean_filter_index_ult >= ULT_WINDOW) {
		mean_filter_index_ult = 0;
	}
	double sum = 0;
	for (int i = 0; i < ULT_WINDOW; i++) {
		sum += mean_filter_ult_buffer[i];
	}
	return (double)sum / ULT_WINDOW;
}

int in_position_detect (int ult_dis, int pir_value) {
	if (pir_value && ult_dis < MAX_DIS && ult_dis > MIN_DIS) {
		return 1;
	} else {
		return 0;
	}
}

int in_position_detect_mean_filter (double ult_dis, double pir_value) {
	if (pir_value >= PIR_THRESHOLD && ult_dis < MAX_DIS && ult_dis > MIN_DIS) {
		return 1;
	} else {
		return 0;
	}
}

void print_all_state(int ult_dis, int pir_value) {
	//int dis = get_ult_len(fd_ult);
	//int pir = get_pir_state(fd_pir);
	printf("dis: %d pir: %d\n", ult_dis, pir_value);

	printf("start_count:%d \nrecording_count:%d \nend_count:%d\n", start_count, recording_count, end_count);
	printf("alarm_count: %d\n", alarm_count);
	printf("alarm_flag: %d\n", alarm_flag);

	printf("pir_value_mean: %.2f\n", pir_value_mean);
	printf("ult_value_mean: %.2f\n", ult_value_mean);
}

int main()
{
	int fd_ult,fd_pir, ult_dis, pir_value;
	unsigned char msg_buf[200] = {0};
	double ult_len = 0;

	fd_ult = open("/dev/ccd_ult",O_RDWR);
	fd_pir = open("/dev/ccd_pir", O_RDWR);
	if (fd_ult < 0||fd_pir < 0)
	{
		printf("error\n");
		return -1;
	}

	mqtt_init();
	mqtt_connect();
	mqtt_subscribe();
	

	while(1)
	{
		ult_dis = get_ult_len(fd_ult);
		pir_value = get_pir_state(fd_pir);
		pir_value_mean = mean_filter_pir(pir_value);
		ult_value_mean = mean_filter_ult(ult_dis);
	 	// memset(msg_buf,0,200);
		switch (STATE)  //0.1s loop state machine
		{
		case IDLE:
			printf("STATE = IDLE\n");
			alarm_flag = 0;
			end_count = 0;
			// if (in_position_detect(ult_dis, pir_value)) {
			// 	start_count++;
			// }
			if (in_position_detect_mean_filter(ult_value_mean, pir_value_mean)) {  //使用均值滤波进行判断
				start_count++;
			}
			else if (start_count > 0) 
				start_count--;
			if (start_count > 80) {
				STATE = RECORDING;
				start_count = 0;
				printf("START RECORDING! STATE GOES TO RECORDING\n");
			}
			break;

		case RECORDING:
			printf("STATE = RECORDING\n");
			recording_count++;
			if (recording_count > 300) { // 600*0.1 = 30s = 0.5 min for test
				recording_count = 0;
				STATE = ALARM;
				
			}			
			if (!in_position_detect_mean_filter(ult_value_mean, pir_value_mean)) {  //使用均值滤波进行判断
				end_count++;
				printf("OUT OF POSITION! END COUNT: %d\n", end_count);
			}
			else if (end_count > 0) 
				end_count--;
			if (end_count > 80) {
				end_count = 0;
				STATE = END;
				printf("RECORDING BREAK! STATE GOES TO END\n");
			}

			break;

		case ALARM:
			printf("STATE = ALARM\n");
			alarm_flag = 1;
			if (alarm_count < 100) {
				alarm_count++;
				printf("SITTING FOR TOO LONG, ALARM\n");
			} else if (alarm_count >= 100) {
				alarm_count = 0;
				STATE = IDLE;
			}
			recording_count = 0;
			end_count = 0;
			break;

		case END:
			end_count = 0;
			alarm_flag = 0;
			recording_count = 0;
			printf("STATE = END\n");
			/* code */

			STATE = IDLE;
			printf("RECORDING END! STATE GOES TO IDLE\n");
			break;

		default:
			break;
		}
		print_all_state(ult_dis, pir_value);
		sitting_time = (double)recording_count * 0.1; // 0.1s * count
		int state1 = (int)STATE;
		sprintf(msg_buf,"{\'id\':1,\'dp\':{\'state\':[{\'v':\'%d\'}],  \'distance\':[{\'v':\'%.2f\'}], \'pir\':[{\'v':\'%.2f\'}],  \'sitting_time\':[{\'v':\'%.2f\'}],  \'alarm\':[{\'v':\'%d\'}]}}", state1, ult_value_mean, pir_value_mean, sitting_time, alarm_flag);
	
		mqtt_publish(msg_buf);

		usleep(100000); // 0.1 秒

	}

}
