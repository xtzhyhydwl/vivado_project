
#include "xil_io.h"
#include "xiic.h"
#include "xiic_l.h"
#include "xil_printf.h"
#include "sleep.h"
#include "xparameters.h"
#include "utils.h"
#define Base_Addr   0x41600000

//BME280设备参数
	#define Slave_Addr 0x76 //从设备地址
	#define P_reg      0xF7 //气压数据寄存器 0xF7-0xF9
    #define H_reg      0xFD //湿度数据寄存器 0xFD-0xFE
	#define T_reg      0xFA //温度数据寄存器 0xfa-0xfc
	//气压补偿参数寄存器
	#define BME280_REG_DIG_P1    0x8E
	#define BME280_REG_DIG_P2    0x90
	#define BME280_REG_DIG_P3    0x92
	#define BME280_REG_DIG_P4    0x94
	#define BME280_REG_DIG_P5    0x96
	#define BME280_REG_DIG_P6    0x98
	#define BME280_REG_DIG_P7    0x9A
	#define BME280_REG_DIG_P8    0x9C
	#define BME280_REG_DIG_P9    0x9E
	u16 dig_P1,dig_P2,dig_P3,dig_P4,dig_P5,dig_P6,dig_P7,dig_P8,dig_P9;
	//温度补偿参数寄存器
	#define BME280_REG_DIG_T1    0x88
	#define BME280_REG_DIG_T2    0x8A
	#define BME280_REG_DIG_T3    0x8C
	u16 dig_T1,dig_T2,dig_T3;
	u64 t_fine;
	//湿度补偿参数寄存器
	#define BME280_REG_DIG_H1    0xA1
	#define BME280_REG_DIG_H2    0xE1
	#define BME280_REG_DIG_H3    0xE3
	#define BME280_REG_DIG_H4    0xE4
	#define BME280_REG_DIG_H5    0xE5
	#define BME280_REG_DIG_H6    0xE7
	u16 dig_H1,dig_H2,dig_H3,dig_H4,dig_H5,dig_H6;
	//配置寄存器
	#define BME280_REG_CONTROLHUMID    0xF2
	#define BME280_REG_CONTROL         0xF4
	#define BME280_REG_CONFIG          0xF5


void init();
u32 getPressureData();
u32 getHumidityData();
u32 getTemperatureData();

u16 BME280ReadS16LE(u8 reg);
u16 BME280Read16LE(u8 reg);
u16 BME280Read8(u8 reg);

int write(u8 reg,u8 Data);
u8 Read(u8 reg);


int main()
{
	init();
    while (1){
    	int getdata_T = getTemperatureData();
    	xil_printf("温度为：%d °C\n",getdata_T);
    	u32 getdata_H = getHumidityData();
    	xil_printf("湿度为：%d %% \n",getdata_H);
    	u32 getdata_P = getPressureData();
        xil_printf("气压为：%d Pa\n",getdata_P);
        hard_delay_ms(100);
    }
	return 0;
}

void init()
{
	write(BME280_REG_CONTROLHUMID, 0x05);  //Choose 16X oversampling
    write(BME280_REG_CONTROL, 0xB7);  //Choose 16X oversampling
	/**/
    dig_T1 = BME280Read16LE(BME280_REG_DIG_T1);
    dig_T2 = BME280ReadS16LE(BME280_REG_DIG_T2);
    dig_T3 = BME280ReadS16LE(BME280_REG_DIG_T3);
	/**/
    dig_P1 = BME280Read16LE(BME280_REG_DIG_P1);
    dig_P2 = BME280ReadS16LE(BME280_REG_DIG_P2);
    dig_P3 = BME280ReadS16LE(BME280_REG_DIG_P3);
    dig_P4 = BME280ReadS16LE(BME280_REG_DIG_P4);
    dig_P5 = BME280ReadS16LE(BME280_REG_DIG_P5);
    dig_P6 = BME280ReadS16LE(BME280_REG_DIG_P6);
    dig_P7 = BME280ReadS16LE(BME280_REG_DIG_P7);
    dig_P8 = BME280ReadS16LE(BME280_REG_DIG_P8);
    dig_P9 = BME280ReadS16LE(BME280_REG_DIG_P9);

    /**/
    dig_H1 = BME280Read8(BME280_REG_DIG_H1);
    dig_H2 = BME280Read16LE(BME280_REG_DIG_H2);
    dig_H3 = BME280Read8(BME280_REG_DIG_H3);
    dig_H4 = (BME280Read8(BME280_REG_DIG_H4) << 4) | (0x0F & BME280Read8(BME280_REG_DIG_H4 + 1));
    dig_H5 = (BME280Read8(BME280_REG_DIG_H5 + 1) << 4) | (0x0F & BME280Read8(BME280_REG_DIG_H5) >> 4);
    dig_H6 = (u8)BME280Read8(BME280_REG_DIG_H6);
}

u32 getPressureData()
{
	u64 p;
	u64 var1,var2;

	p = Read(P_reg);//0xf7
	p = (p<<8)|Read(P_reg+1);//0xf8
	p = (p<<8)|Read(P_reg+2);//0xf9
    p = p>>4;//获取20bits数据

    var1 = (t_fine) - 128000;
    var2 = var1 * var1 * (u64)dig_P6;
    var2 = var2 + ((var1 * (u64)dig_P5) << 17);
    var2 = var2 + (((u64)dig_P4) << 35);
    var1 = ((var1 * var1 * (u64)dig_P3) >> 8) + ((var1 * (u64)dig_P2) << 12);
    var1 = (((((u64)1) << 47) + var1)) * ((u64)dig_P1) >> 33;
    if (var1 == 0) {
        return 0; // avoid exception caused by division by zero
    }
    p = 1048576 - p;
    p = (((p << 31) - var2) * 3125) / var1;
    var1 = (((u64)dig_P9) * (p >> 13) * (p >> 13)) >> 25;
    var2 = (((u64)dig_P8) * p) >> 19;
    p = ((p + var1 + var2) >> 8) + (((u64)dig_P7) << 4);
    return (u32)p >> 10;
}

u32 getHumidityData()
{
	u32 v_x1_u32r, adc_H;
	adc_H = Read(H_reg);
	adc_H = (adc_H<<8)|Read(H_reg+1);//16位数据
    v_x1_u32r = (t_fine - ((u32)76800));
    v_x1_u32r = (((((adc_H << 14) - (((u32)dig_H4) << 20) - (((u32)dig_H5) * v_x1_u32r)) + ((
                       u32)16384)) >> 15) * (((((((v_x1_u32r * ((u32)dig_H6)) >> 10) * (((v_x1_u32r * ((u32)dig_H3)) >> 11) + ((
                                   u32)32768))) >> 10) + ((u32)2097152)) * ((u32)dig_H2) + 8192) >> 14));
    v_x1_u32r = (v_x1_u32r - (((((v_x1_u32r >> 15) * (v_x1_u32r >> 15)) >> 7) * ((u32)dig_H1)) >> 4));
    v_x1_u32r = (v_x1_u32r < 0 ? 0 : v_x1_u32r);
    v_x1_u32r = (v_x1_u32r > 419430400 ? 419430400 : v_x1_u32r);
    return (u32)(v_x1_u32r >> 12) / 1024.0;
}

u32 getTemperatureData()
{
	u32 var1, var2;
	u32 t;
	t = Read(T_reg);//0xfa
	t = (t<<8)|Read(T_reg+1);//0xf8
	t = (t<<8)|Read(T_reg+2);//0xf9
	t = t>>4;
    var1 = (((t >> 3) - ((u32)(dig_T1 << 1))) *
            ((u32)dig_T2)) >> 11;

    var2 = (((((t >> 4) - ((u32)dig_T1)) *
              ((t >> 4) - ((u32)dig_T1))) >> 12) *
            ((u32)dig_T3)) >> 14;
    t_fine = (var1 + var2);
    int T = (t_fine * 5 + 128) >> 8;
    return T / 100-30;

}

u8 Read(u8 reg)
{
    u8 A[1] = {reg};
    u8 *Ptr = A;
    u8 Buffer[1];
    XIic_Send(Base_Addr, Slave_Addr,  Ptr, 1, XIIC_STOP);
    XIic_Recv(Base_Addr, Slave_Addr,  Buffer, 1, XIIC_STOP);//IIC读总线时序：Slave_Addr ACK Reg_Addr ACK Reg_Data...
    return Buffer[0];
}

int write(u8 reg,u8 Data)
{
    int Result;
    u8 A[2] = {reg,Data};
    u8 *Ptr = A;
    Result = XIic_Send(Base_Addr, Slave_Addr, Ptr, 2, XIIC_STOP);//IIC写总线时序：Slave_Addr ACK Reg_Addr ACK Data ACK...
    return Result;
}

u16 BME280Read16LE(u8 reg)
{
	u8 msb, lsb;
	msb = Read(reg);
	lsb = Read(reg+1);
    u16 data = ((u16)msb<<8) | lsb;
    return (data>>8)|(data<<8);
}

u16 BME280ReadS16LE(u8 reg)
{
	u8 msb, lsb;
	msb = Read(reg);
	lsb = Read(reg+1);
    u16 data = ((u16)msb<<8) | lsb;
    return data;
}
u16  BME280Read8(u8 reg)
{
    return Read(reg);
}




