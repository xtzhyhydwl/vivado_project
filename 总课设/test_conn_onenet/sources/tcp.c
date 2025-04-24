#include <stdio.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <unistd.h> 
#include <string.h> 
#include <stdlib.h> 

#include "tcp.h"


static int socket_fd = -1;

int tcp_init(void)
{
	// 创建套接字
	socket_fd = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
	if(socket_fd == -1)
	{
		perror("socket failed!\n");
		return -1;
	}
	// 向服务器发起请求
	struct sockaddr_in server_addr = {0};
	server_addr.sin_family = AF_INET;					//使用IPv4地址
	server_addr.sin_port = htons(PORT);					//端口
	server_addr.sin_addr.s_addr = inet_addr(IP_ADDR);	//具体的IP地址

	int ret = connect(socket_fd, (struct sockaddr *)&server_addr, sizeof(server_addr));	
	if(ret != 0) {		
		perror("TCP connect failed!\n");
		return -1;
	}
	return 0;
}


int tcp_send(char *buf,int len)
{
	int ret = write(socket_fd, buf, len);
	if(ret < 0)      
	{         
		perror("send\n");          
		close(socket_fd);          
		return -1;      
	}
	return ret;
}


int tcp_rev(char *buf,int len)
{
	bzero(buf, len);
	int ret = recv(socket_fd, buf, len, 0);   
	if(ret < 0)      
	{         
		perror("recv\n");          
		close(socket_fd);          
		return -1;      
	}
	return ret;
}


void close_tcp(void)
{
	close(socket_fd);
	socket_fd = -1;
}
