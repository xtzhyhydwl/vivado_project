
#include "xil_printf.h"
#include "sleep.h"
#include "xsysmon.h"
#include "utils.h"
#define printf xil_printf
XSysMon ADC_Wiz;
void Init_XADCW()
{
	XSysMon_Config* Config;
	Config = XSysMon_LookupConfig(0U);
	XSysMon_CfgInitialize(&ADC_Wiz,Config,Config->BaseAddress);
	XSysMon_Reset(&ADC_Wiz);
	XSysMon_SetSequencerMode(&ADC_Wiz,XSM_SEQ_MODE_CONTINPASS);
	XSysMon_SetExtenalMux(&ADC_Wiz,27);//11
}
float GetV()
{
	float vol;
	u16 AdcData = XSysMon_GetAdcData(&ADC_Wiz,27);//chanel 11 µÄµØÖ·
	vol = AdcData >> 4;
	return vol;
}
void volt_printfloat(float num)
{
	int temp = num*1000/10;
	int a,b,c;
	u8 p[5];
	c = temp%10;
	b = ((temp-c)%100)/10;
	a = (temp-b*10-c)/100;
    p[0] = a+'0';p[1] =0x2e;p[2]=b+'0';p[3]=c+'0';p[4]='\0';//×ªASCII
	xil_printf("volt = %s;\n\r",p);
}
int main()
{
	float sensorValue,volt;
    Init_XADCW();
    while(1)
    {
    	sensorValue =  GetV();
    	xil_printf("sensorValue(ad) = %d;\n\r",(int)sensorValue);
    	volt = 2.04*sensorValue/2648;
    	volt_printfloat(volt);
    	hard_delay_ms(200);
    }
    return 0;
}






