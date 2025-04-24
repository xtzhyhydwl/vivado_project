#ifndef UTILS_H
#define UTILS_H

#include <stdio.h>
#include <string.h>


void print_hex(unsigned char *s,int len)

{
    int i = 0;
    while(i < len)
    {
        printf("0x%02x ",s[i]);
        i++;
    }
    printf("\n");
}


static void str_cpy(unsigned char *s1, unsigned char *s2, unsigned char len)
{
    unsigned char i = 0;
    while(i < len)
    {
        s1[i] = s2[i];
        i++;
    }
}

#endif //UTILS_H
