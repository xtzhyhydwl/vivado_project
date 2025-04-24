#ifndef __TCP_H
#define __TCP_H


#define IP_ADDR     "183.230.40.96"
#define PORT        1883

int tcp_init(void);

int tcp_send(char *buf,int len);
int tcp_rev(char *buf,int len);

void close_tcp(void);

#endif

