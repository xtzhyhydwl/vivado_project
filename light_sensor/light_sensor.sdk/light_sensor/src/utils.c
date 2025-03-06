/*
 * @Author: xiayuan 1137542776@qq.com
 * @Date: 2025-03-06 10:53:47
 * @LastEditors: xiayuan 1137542776@qq.com
 * @LastEditTime: 2025-03-06 10:55:58
 * @FilePath: \undefinedc:\Users\MikanseiP\Desktop\zonghekechengsheji\project\headfiles\utils.h
 * @Description: utils for xilinx zynq project
 * 
 * Copyright (c) 2025 by xiayuan, All Rights Reserved. 
 */
#include "utils.h"

/**
 * @description: ”≤—” ±∫Ø ˝£¨—” ±usŒ¢√Î
 * @param {int} us
 * @param {us_unit *} us
 * @return {*}
 */
void hard_delay_us(int us) {
	int us_unit = XPAR_CPU_CORTEXA9_CORE_CLOCK_FREQ_HZ / 2000000;
	XTime t1, t2;
	XTime_GetTime(&t1);
	t2 = t1 + 1;
	while (t2 - t1 < us_unit * us) {
		XTime_GetTime(&t2);
	}
}

/**
 * @description: ”≤—” ±∫Ø ˝£¨—” ±ms∫¡√Î
 * @param {int} ms
 * @param {ms_unit *} ms
 * @return {*}
 */
void hard_delay_ms(int ms) {
	int ms_unit = XPAR_CPU_CORTEXA9_CORE_CLOCK_FREQ_HZ / 2000;
	XTime t1, t2;
	XTime_GetTime(&t1);
	t2 = t1 + 1;
	while (t2 - t1 < ms_unit * ms) {
		XTime_GetTime(&t2);
	}
}