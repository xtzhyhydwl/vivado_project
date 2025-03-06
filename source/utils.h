/*
 * @Author: xiayuan 1137542776@qq.com
 * @Date: 2025-03-06 10:53:47
 * @LastEditors: xiayuan 1137542776@qq.com
 * @LastEditTime: 2025-03-06 10:58:09
 * @FilePath: \source\utils.h
 * @Description: utils for xilinx zynq project
 * 
 * Copyright (c) 2025 by xiayuan, All Rights Reserved. 
 */
#include "xil_io.h"
#include"xil_printf.h"//有输出语句就要用到
#include "xtime_l.h"

void hard_delay_us(int us);
void hard_delay_ms(int ms);