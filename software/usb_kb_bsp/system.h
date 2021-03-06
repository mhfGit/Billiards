/*
 * system.h - SOPC Builder system and BSP software package information
 *
 * Machine generated for CPU 'nios2_qsys_0' in SOPC Builder design 'nios_system'
 * SOPC Builder design path: ../../nios_system.sopcinfo
 *
 * Generated: Sat Dec 05 22:43:13 CST 2015
 */

/*
 * DO NOT MODIFY THIS FILE
 *
 * Changing this file will have subtle consequences
 * which will almost certainly lead to a nonfunctioning
 * system. If you do modify this file, be aware that your
 * changes will be overwritten and lost when this file
 * is generated again.
 *
 * DO NOT MODIFY THIS FILE
 */

/*
 * License Agreement
 *
 * Copyright (c) 2008
 * Altera Corporation, San Jose, California, USA.
 * All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *
 * This agreement shall be governed in all respects by the laws of the State
 * of California and by the laws of the United States of America.
 */

#ifndef __SYSTEM_H_
#define __SYSTEM_H_

/* Include definitions from linker script generator */
#include "linker.h"


/*
 * CPU configuration
 *
 */

#define ALT_CPU_ARCHITECTURE "altera_nios2_qsys"
#define ALT_CPU_BIG_ENDIAN 0
#define ALT_CPU_BREAK_ADDR 0x00001020
#define ALT_CPU_CPU_FREQ 50000000u
#define ALT_CPU_CPU_ID_SIZE 1
#define ALT_CPU_CPU_ID_VALUE 0x00000000
#define ALT_CPU_CPU_IMPLEMENTATION "tiny"
#define ALT_CPU_DATA_ADDR_WIDTH 0x1d
#define ALT_CPU_DCACHE_LINE_SIZE 0
#define ALT_CPU_DCACHE_LINE_SIZE_LOG2 0
#define ALT_CPU_DCACHE_SIZE 0
#define ALT_CPU_EXCEPTION_ADDR 0x10000020
#define ALT_CPU_FLUSHDA_SUPPORTED
#define ALT_CPU_FREQ 50000000
#define ALT_CPU_HARDWARE_DIVIDE_PRESENT 0
#define ALT_CPU_HARDWARE_MULTIPLY_PRESENT 0
#define ALT_CPU_HARDWARE_MULX_PRESENT 0
#define ALT_CPU_HAS_DEBUG_CORE 1
#define ALT_CPU_HAS_DEBUG_STUB
#define ALT_CPU_HAS_JMPI_INSTRUCTION
#define ALT_CPU_ICACHE_LINE_SIZE 0
#define ALT_CPU_ICACHE_LINE_SIZE_LOG2 0
#define ALT_CPU_ICACHE_SIZE 0
#define ALT_CPU_INST_ADDR_WIDTH 0x1d
#define ALT_CPU_NAME "nios2_qsys_0"
#define ALT_CPU_RESET_ADDR 0x10000000


/*
 * CPU configuration (with legacy prefix - don't use these anymore)
 *
 */

#define NIOS2_BIG_ENDIAN 0
#define NIOS2_BREAK_ADDR 0x00001020
#define NIOS2_CPU_FREQ 50000000u
#define NIOS2_CPU_ID_SIZE 1
#define NIOS2_CPU_ID_VALUE 0x00000000
#define NIOS2_CPU_IMPLEMENTATION "tiny"
#define NIOS2_DATA_ADDR_WIDTH 0x1d
#define NIOS2_DCACHE_LINE_SIZE 0
#define NIOS2_DCACHE_LINE_SIZE_LOG2 0
#define NIOS2_DCACHE_SIZE 0
#define NIOS2_EXCEPTION_ADDR 0x10000020
#define NIOS2_FLUSHDA_SUPPORTED
#define NIOS2_HARDWARE_DIVIDE_PRESENT 0
#define NIOS2_HARDWARE_MULTIPLY_PRESENT 0
#define NIOS2_HARDWARE_MULX_PRESENT 0
#define NIOS2_HAS_DEBUG_CORE 1
#define NIOS2_HAS_DEBUG_STUB
#define NIOS2_HAS_JMPI_INSTRUCTION
#define NIOS2_ICACHE_LINE_SIZE 0
#define NIOS2_ICACHE_LINE_SIZE_LOG2 0
#define NIOS2_ICACHE_SIZE 0
#define NIOS2_INST_ADDR_WIDTH 0x1d
#define NIOS2_RESET_ADDR 0x10000000


/*
 * Define for each module class mastered by the CPU
 *
 */

#define __ALTERA_AVALON_JTAG_UART
#define __ALTERA_AVALON_NEW_SDRAM_CONTROLLER
#define __ALTERA_AVALON_ONCHIP_MEMORY2
#define __ALTERA_AVALON_PIO
#define __ALTERA_AVALON_SYSID_QSYS
#define __ALTERA_NIOS2_QSYS
#define __ALTPLL


/*
 * EightBall configuration
 *
 */

#define ALT_MODULE_CLASS_EightBall altera_avalon_pio
#define EIGHTBALL_BASE 0xe0
#define EIGHTBALL_BIT_CLEARING_EDGE_REGISTER 0
#define EIGHTBALL_BIT_MODIFYING_OUTPUT_REGISTER 0
#define EIGHTBALL_CAPTURE 0
#define EIGHTBALL_DATA_WIDTH 20
#define EIGHTBALL_DO_TEST_BENCH_WIRING 0
#define EIGHTBALL_DRIVEN_SIM_VALUE 0
#define EIGHTBALL_EDGE_TYPE "NONE"
#define EIGHTBALL_FREQ 50000000
#define EIGHTBALL_HAS_IN 0
#define EIGHTBALL_HAS_OUT 1
#define EIGHTBALL_HAS_TRI 0
#define EIGHTBALL_IRQ -1
#define EIGHTBALL_IRQ_INTERRUPT_CONTROLLER_ID -1
#define EIGHTBALL_IRQ_TYPE "NONE"
#define EIGHTBALL_NAME "/dev/EightBall"
#define EIGHTBALL_RESET_VALUE 0
#define EIGHTBALL_SPAN 16
#define EIGHTBALL_TYPE "altera_avalon_pio"


/*
 * ElevenBall configuration
 *
 */

#define ALT_MODULE_CLASS_ElevenBall altera_avalon_pio
#define ELEVENBALL_BASE 0xb0
#define ELEVENBALL_BIT_CLEARING_EDGE_REGISTER 0
#define ELEVENBALL_BIT_MODIFYING_OUTPUT_REGISTER 0
#define ELEVENBALL_CAPTURE 0
#define ELEVENBALL_DATA_WIDTH 20
#define ELEVENBALL_DO_TEST_BENCH_WIRING 0
#define ELEVENBALL_DRIVEN_SIM_VALUE 0
#define ELEVENBALL_EDGE_TYPE "NONE"
#define ELEVENBALL_FREQ 50000000
#define ELEVENBALL_HAS_IN 0
#define ELEVENBALL_HAS_OUT 1
#define ELEVENBALL_HAS_TRI 0
#define ELEVENBALL_IRQ -1
#define ELEVENBALL_IRQ_INTERRUPT_CONTROLLER_ID -1
#define ELEVENBALL_IRQ_TYPE "NONE"
#define ELEVENBALL_NAME "/dev/ElevenBall"
#define ELEVENBALL_RESET_VALUE 0
#define ELEVENBALL_SPAN 16
#define ELEVENBALL_TYPE "altera_avalon_pio"


/*
 * FifteenBall configuration
 *
 */

#define ALT_MODULE_CLASS_FifteenBall altera_avalon_pio
#define FIFTEENBALL_BASE 0x70
#define FIFTEENBALL_BIT_CLEARING_EDGE_REGISTER 0
#define FIFTEENBALL_BIT_MODIFYING_OUTPUT_REGISTER 0
#define FIFTEENBALL_CAPTURE 0
#define FIFTEENBALL_DATA_WIDTH 20
#define FIFTEENBALL_DO_TEST_BENCH_WIRING 0
#define FIFTEENBALL_DRIVEN_SIM_VALUE 0
#define FIFTEENBALL_EDGE_TYPE "NONE"
#define FIFTEENBALL_FREQ 50000000
#define FIFTEENBALL_HAS_IN 0
#define FIFTEENBALL_HAS_OUT 1
#define FIFTEENBALL_HAS_TRI 0
#define FIFTEENBALL_IRQ -1
#define FIFTEENBALL_IRQ_INTERRUPT_CONTROLLER_ID -1
#define FIFTEENBALL_IRQ_TYPE "NONE"
#define FIFTEENBALL_NAME "/dev/FifteenBall"
#define FIFTEENBALL_RESET_VALUE 0
#define FIFTEENBALL_SPAN 16
#define FIFTEENBALL_TYPE "altera_avalon_pio"


/*
 * FiveBall configuration
 *
 */

#define ALT_MODULE_CLASS_FiveBall altera_avalon_pio
#define FIVEBALL_BASE 0x110
#define FIVEBALL_BIT_CLEARING_EDGE_REGISTER 0
#define FIVEBALL_BIT_MODIFYING_OUTPUT_REGISTER 0
#define FIVEBALL_CAPTURE 0
#define FIVEBALL_DATA_WIDTH 20
#define FIVEBALL_DO_TEST_BENCH_WIRING 0
#define FIVEBALL_DRIVEN_SIM_VALUE 0
#define FIVEBALL_EDGE_TYPE "NONE"
#define FIVEBALL_FREQ 50000000
#define FIVEBALL_HAS_IN 0
#define FIVEBALL_HAS_OUT 1
#define FIVEBALL_HAS_TRI 0
#define FIVEBALL_IRQ -1
#define FIVEBALL_IRQ_INTERRUPT_CONTROLLER_ID -1
#define FIVEBALL_IRQ_TYPE "NONE"
#define FIVEBALL_NAME "/dev/FiveBall"
#define FIVEBALL_RESET_VALUE 0
#define FIVEBALL_SPAN 16
#define FIVEBALL_TYPE "altera_avalon_pio"


/*
 * FourBall configuration
 *
 */

#define ALT_MODULE_CLASS_FourBall altera_avalon_pio
#define FOURBALL_BASE 0x120
#define FOURBALL_BIT_CLEARING_EDGE_REGISTER 0
#define FOURBALL_BIT_MODIFYING_OUTPUT_REGISTER 0
#define FOURBALL_CAPTURE 0
#define FOURBALL_DATA_WIDTH 20
#define FOURBALL_DO_TEST_BENCH_WIRING 0
#define FOURBALL_DRIVEN_SIM_VALUE 0
#define FOURBALL_EDGE_TYPE "NONE"
#define FOURBALL_FREQ 50000000
#define FOURBALL_HAS_IN 0
#define FOURBALL_HAS_OUT 1
#define FOURBALL_HAS_TRI 0
#define FOURBALL_IRQ -1
#define FOURBALL_IRQ_INTERRUPT_CONTROLLER_ID -1
#define FOURBALL_IRQ_TYPE "NONE"
#define FOURBALL_NAME "/dev/FourBall"
#define FOURBALL_RESET_VALUE 0
#define FOURBALL_SPAN 16
#define FOURBALL_TYPE "altera_avalon_pio"


/*
 * FourteenBall configuration
 *
 */

#define ALT_MODULE_CLASS_FourteenBall altera_avalon_pio
#define FOURTEENBALL_BASE 0x80
#define FOURTEENBALL_BIT_CLEARING_EDGE_REGISTER 0
#define FOURTEENBALL_BIT_MODIFYING_OUTPUT_REGISTER 0
#define FOURTEENBALL_CAPTURE 0
#define FOURTEENBALL_DATA_WIDTH 20
#define FOURTEENBALL_DO_TEST_BENCH_WIRING 0
#define FOURTEENBALL_DRIVEN_SIM_VALUE 0
#define FOURTEENBALL_EDGE_TYPE "NONE"
#define FOURTEENBALL_FREQ 50000000
#define FOURTEENBALL_HAS_IN 0
#define FOURTEENBALL_HAS_OUT 1
#define FOURTEENBALL_HAS_TRI 0
#define FOURTEENBALL_IRQ -1
#define FOURTEENBALL_IRQ_INTERRUPT_CONTROLLER_ID -1
#define FOURTEENBALL_IRQ_TYPE "NONE"
#define FOURTEENBALL_NAME "/dev/FourteenBall"
#define FOURTEENBALL_RESET_VALUE 0
#define FOURTEENBALL_SPAN 16
#define FOURTEENBALL_TYPE "altera_avalon_pio"


/*
 * NineBall configuration
 *
 */

#define ALT_MODULE_CLASS_NineBall altera_avalon_pio
#define NINEBALL_BASE 0xd0
#define NINEBALL_BIT_CLEARING_EDGE_REGISTER 0
#define NINEBALL_BIT_MODIFYING_OUTPUT_REGISTER 0
#define NINEBALL_CAPTURE 0
#define NINEBALL_DATA_WIDTH 20
#define NINEBALL_DO_TEST_BENCH_WIRING 0
#define NINEBALL_DRIVEN_SIM_VALUE 0
#define NINEBALL_EDGE_TYPE "NONE"
#define NINEBALL_FREQ 50000000
#define NINEBALL_HAS_IN 0
#define NINEBALL_HAS_OUT 1
#define NINEBALL_HAS_TRI 0
#define NINEBALL_IRQ -1
#define NINEBALL_IRQ_INTERRUPT_CONTROLLER_ID -1
#define NINEBALL_IRQ_TYPE "NONE"
#define NINEBALL_NAME "/dev/NineBall"
#define NINEBALL_RESET_VALUE 0
#define NINEBALL_SPAN 16
#define NINEBALL_TYPE "altera_avalon_pio"


/*
 * OneBall configuration
 *
 */

#define ALT_MODULE_CLASS_OneBall altera_avalon_pio
#define ONEBALL_BASE 0x150
#define ONEBALL_BIT_CLEARING_EDGE_REGISTER 0
#define ONEBALL_BIT_MODIFYING_OUTPUT_REGISTER 0
#define ONEBALL_CAPTURE 0
#define ONEBALL_DATA_WIDTH 20
#define ONEBALL_DO_TEST_BENCH_WIRING 0
#define ONEBALL_DRIVEN_SIM_VALUE 0
#define ONEBALL_EDGE_TYPE "NONE"
#define ONEBALL_FREQ 50000000
#define ONEBALL_HAS_IN 0
#define ONEBALL_HAS_OUT 1
#define ONEBALL_HAS_TRI 0
#define ONEBALL_IRQ -1
#define ONEBALL_IRQ_INTERRUPT_CONTROLLER_ID -1
#define ONEBALL_IRQ_TYPE "NONE"
#define ONEBALL_NAME "/dev/OneBall"
#define ONEBALL_RESET_VALUE 0
#define ONEBALL_SPAN 16
#define ONEBALL_TYPE "altera_avalon_pio"


/*
 * SevenBall configuration
 *
 */

#define ALT_MODULE_CLASS_SevenBall altera_avalon_pio
#define SEVENBALL_BASE 0xf0
#define SEVENBALL_BIT_CLEARING_EDGE_REGISTER 0
#define SEVENBALL_BIT_MODIFYING_OUTPUT_REGISTER 0
#define SEVENBALL_CAPTURE 0
#define SEVENBALL_DATA_WIDTH 20
#define SEVENBALL_DO_TEST_BENCH_WIRING 0
#define SEVENBALL_DRIVEN_SIM_VALUE 0
#define SEVENBALL_EDGE_TYPE "NONE"
#define SEVENBALL_FREQ 50000000
#define SEVENBALL_HAS_IN 0
#define SEVENBALL_HAS_OUT 1
#define SEVENBALL_HAS_TRI 0
#define SEVENBALL_IRQ -1
#define SEVENBALL_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SEVENBALL_IRQ_TYPE "NONE"
#define SEVENBALL_NAME "/dev/SevenBall"
#define SEVENBALL_RESET_VALUE 0
#define SEVENBALL_SPAN 16
#define SEVENBALL_TYPE "altera_avalon_pio"


/*
 * SixBall configuration
 *
 */

#define ALT_MODULE_CLASS_SixBall altera_avalon_pio
#define SIXBALL_BASE 0x100
#define SIXBALL_BIT_CLEARING_EDGE_REGISTER 0
#define SIXBALL_BIT_MODIFYING_OUTPUT_REGISTER 0
#define SIXBALL_CAPTURE 0
#define SIXBALL_DATA_WIDTH 20
#define SIXBALL_DO_TEST_BENCH_WIRING 0
#define SIXBALL_DRIVEN_SIM_VALUE 0
#define SIXBALL_EDGE_TYPE "NONE"
#define SIXBALL_FREQ 50000000
#define SIXBALL_HAS_IN 0
#define SIXBALL_HAS_OUT 1
#define SIXBALL_HAS_TRI 0
#define SIXBALL_IRQ -1
#define SIXBALL_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SIXBALL_IRQ_TYPE "NONE"
#define SIXBALL_NAME "/dev/SixBall"
#define SIXBALL_RESET_VALUE 0
#define SIXBALL_SPAN 16
#define SIXBALL_TYPE "altera_avalon_pio"


/*
 * System configuration
 *
 */

#define ALT_DEVICE_FAMILY "Cyclone IV E"
#define ALT_ENHANCED_INTERRUPT_API_PRESENT
#define ALT_IRQ_BASE NULL
#define ALT_LOG_PORT "/dev/null"
#define ALT_LOG_PORT_BASE 0x0
#define ALT_LOG_PORT_DEV null
#define ALT_LOG_PORT_TYPE ""
#define ALT_NUM_EXTERNAL_INTERRUPT_CONTROLLERS 0
#define ALT_NUM_INTERNAL_INTERRUPT_CONTROLLERS 1
#define ALT_NUM_INTERRUPT_CONTROLLERS 1
#define ALT_STDERR "/dev/jtag_uart_0"
#define ALT_STDERR_BASE 0x1e0
#define ALT_STDERR_DEV jtag_uart_0
#define ALT_STDERR_IS_JTAG_UART
#define ALT_STDERR_PRESENT
#define ALT_STDERR_TYPE "altera_avalon_jtag_uart"
#define ALT_STDIN "/dev/jtag_uart_0"
#define ALT_STDIN_BASE 0x1e0
#define ALT_STDIN_DEV jtag_uart_0
#define ALT_STDIN_IS_JTAG_UART
#define ALT_STDIN_PRESENT
#define ALT_STDIN_TYPE "altera_avalon_jtag_uart"
#define ALT_STDOUT "/dev/jtag_uart_0"
#define ALT_STDOUT_BASE 0x1e0
#define ALT_STDOUT_DEV jtag_uart_0
#define ALT_STDOUT_IS_JTAG_UART
#define ALT_STDOUT_PRESENT
#define ALT_STDOUT_TYPE "altera_avalon_jtag_uart"
#define ALT_SYSTEM_NAME "nios_system"


/*
 * TenBall configuration
 *
 */

#define ALT_MODULE_CLASS_TenBall altera_avalon_pio
#define TENBALL_BASE 0xc0
#define TENBALL_BIT_CLEARING_EDGE_REGISTER 0
#define TENBALL_BIT_MODIFYING_OUTPUT_REGISTER 0
#define TENBALL_CAPTURE 0
#define TENBALL_DATA_WIDTH 20
#define TENBALL_DO_TEST_BENCH_WIRING 0
#define TENBALL_DRIVEN_SIM_VALUE 0
#define TENBALL_EDGE_TYPE "NONE"
#define TENBALL_FREQ 50000000
#define TENBALL_HAS_IN 0
#define TENBALL_HAS_OUT 1
#define TENBALL_HAS_TRI 0
#define TENBALL_IRQ -1
#define TENBALL_IRQ_INTERRUPT_CONTROLLER_ID -1
#define TENBALL_IRQ_TYPE "NONE"
#define TENBALL_NAME "/dev/TenBall"
#define TENBALL_RESET_VALUE 0
#define TENBALL_SPAN 16
#define TENBALL_TYPE "altera_avalon_pio"


/*
 * ThirteenBall configuration
 *
 */

#define ALT_MODULE_CLASS_ThirteenBall altera_avalon_pio
#define THIRTEENBALL_BASE 0x90
#define THIRTEENBALL_BIT_CLEARING_EDGE_REGISTER 0
#define THIRTEENBALL_BIT_MODIFYING_OUTPUT_REGISTER 0
#define THIRTEENBALL_CAPTURE 0
#define THIRTEENBALL_DATA_WIDTH 20
#define THIRTEENBALL_DO_TEST_BENCH_WIRING 0
#define THIRTEENBALL_DRIVEN_SIM_VALUE 0
#define THIRTEENBALL_EDGE_TYPE "NONE"
#define THIRTEENBALL_FREQ 50000000
#define THIRTEENBALL_HAS_IN 0
#define THIRTEENBALL_HAS_OUT 1
#define THIRTEENBALL_HAS_TRI 0
#define THIRTEENBALL_IRQ -1
#define THIRTEENBALL_IRQ_INTERRUPT_CONTROLLER_ID -1
#define THIRTEENBALL_IRQ_TYPE "NONE"
#define THIRTEENBALL_NAME "/dev/ThirteenBall"
#define THIRTEENBALL_RESET_VALUE 0
#define THIRTEENBALL_SPAN 16
#define THIRTEENBALL_TYPE "altera_avalon_pio"


/*
 * ThreeBall configuration
 *
 */

#define ALT_MODULE_CLASS_ThreeBall altera_avalon_pio
#define THREEBALL_BASE 0x130
#define THREEBALL_BIT_CLEARING_EDGE_REGISTER 0
#define THREEBALL_BIT_MODIFYING_OUTPUT_REGISTER 0
#define THREEBALL_CAPTURE 0
#define THREEBALL_DATA_WIDTH 20
#define THREEBALL_DO_TEST_BENCH_WIRING 0
#define THREEBALL_DRIVEN_SIM_VALUE 0
#define THREEBALL_EDGE_TYPE "NONE"
#define THREEBALL_FREQ 50000000
#define THREEBALL_HAS_IN 0
#define THREEBALL_HAS_OUT 1
#define THREEBALL_HAS_TRI 0
#define THREEBALL_IRQ -1
#define THREEBALL_IRQ_INTERRUPT_CONTROLLER_ID -1
#define THREEBALL_IRQ_TYPE "NONE"
#define THREEBALL_NAME "/dev/ThreeBall"
#define THREEBALL_RESET_VALUE 0
#define THREEBALL_SPAN 16
#define THREEBALL_TYPE "altera_avalon_pio"


/*
 * TwelveBall configuration
 *
 */

#define ALT_MODULE_CLASS_TwelveBall altera_avalon_pio
#define TWELVEBALL_BASE 0xa0
#define TWELVEBALL_BIT_CLEARING_EDGE_REGISTER 0
#define TWELVEBALL_BIT_MODIFYING_OUTPUT_REGISTER 0
#define TWELVEBALL_CAPTURE 0
#define TWELVEBALL_DATA_WIDTH 20
#define TWELVEBALL_DO_TEST_BENCH_WIRING 0
#define TWELVEBALL_DRIVEN_SIM_VALUE 0
#define TWELVEBALL_EDGE_TYPE "NONE"
#define TWELVEBALL_FREQ 50000000
#define TWELVEBALL_HAS_IN 0
#define TWELVEBALL_HAS_OUT 1
#define TWELVEBALL_HAS_TRI 0
#define TWELVEBALL_IRQ -1
#define TWELVEBALL_IRQ_INTERRUPT_CONTROLLER_ID -1
#define TWELVEBALL_IRQ_TYPE "NONE"
#define TWELVEBALL_NAME "/dev/TwelveBall"
#define TWELVEBALL_RESET_VALUE 0
#define TWELVEBALL_SPAN 16
#define TWELVEBALL_TYPE "altera_avalon_pio"


/*
 * TwoBall configuration
 *
 */

#define ALT_MODULE_CLASS_TwoBall altera_avalon_pio
#define TWOBALL_BASE 0x140
#define TWOBALL_BIT_CLEARING_EDGE_REGISTER 0
#define TWOBALL_BIT_MODIFYING_OUTPUT_REGISTER 0
#define TWOBALL_CAPTURE 0
#define TWOBALL_DATA_WIDTH 20
#define TWOBALL_DO_TEST_BENCH_WIRING 0
#define TWOBALL_DRIVEN_SIM_VALUE 0
#define TWOBALL_EDGE_TYPE "NONE"
#define TWOBALL_FREQ 50000000
#define TWOBALL_HAS_IN 0
#define TWOBALL_HAS_OUT 1
#define TWOBALL_HAS_TRI 0
#define TWOBALL_IRQ -1
#define TWOBALL_IRQ_INTERRUPT_CONTROLLER_ID -1
#define TWOBALL_IRQ_TYPE "NONE"
#define TWOBALL_NAME "/dev/TwoBall"
#define TWOBALL_RESET_VALUE 0
#define TWOBALL_SPAN 16
#define TWOBALL_TYPE "altera_avalon_pio"


/*
 * cueBall configuration
 *
 */

#define ALT_MODULE_CLASS_cueBall altera_avalon_pio
#define CUEBALL_BASE 0x60
#define CUEBALL_BIT_CLEARING_EDGE_REGISTER 0
#define CUEBALL_BIT_MODIFYING_OUTPUT_REGISTER 0
#define CUEBALL_CAPTURE 0
#define CUEBALL_DATA_WIDTH 20
#define CUEBALL_DO_TEST_BENCH_WIRING 0
#define CUEBALL_DRIVEN_SIM_VALUE 0
#define CUEBALL_EDGE_TYPE "NONE"
#define CUEBALL_FREQ 50000000
#define CUEBALL_HAS_IN 0
#define CUEBALL_HAS_OUT 1
#define CUEBALL_HAS_TRI 0
#define CUEBALL_IRQ -1
#define CUEBALL_IRQ_INTERRUPT_CONTROLLER_ID -1
#define CUEBALL_IRQ_TYPE "NONE"
#define CUEBALL_NAME "/dev/cueBall"
#define CUEBALL_RESET_VALUE 0
#define CUEBALL_SPAN 16
#define CUEBALL_TYPE "altera_avalon_pio"


/*
 * hal configuration
 *
 */

#define ALT_MAX_FD 32
#define ALT_SYS_CLK none
#define ALT_TIMESTAMP_CLK none


/*
 * hw_sig configuration
 *
 */

#define ALT_MODULE_CLASS_hw_sig altera_avalon_pio
#define HW_SIG_BASE 0x30
#define HW_SIG_BIT_CLEARING_EDGE_REGISTER 0
#define HW_SIG_BIT_MODIFYING_OUTPUT_REGISTER 0
#define HW_SIG_CAPTURE 0
#define HW_SIG_DATA_WIDTH 1
#define HW_SIG_DO_TEST_BENCH_WIRING 0
#define HW_SIG_DRIVEN_SIM_VALUE 0
#define HW_SIG_EDGE_TYPE "NONE"
#define HW_SIG_FREQ 50000000
#define HW_SIG_HAS_IN 1
#define HW_SIG_HAS_OUT 0
#define HW_SIG_HAS_TRI 0
#define HW_SIG_IRQ -1
#define HW_SIG_IRQ_INTERRUPT_CONTROLLER_ID -1
#define HW_SIG_IRQ_TYPE "NONE"
#define HW_SIG_NAME "/dev/hw_sig"
#define HW_SIG_RESET_VALUE 0
#define HW_SIG_SPAN 16
#define HW_SIG_TYPE "altera_avalon_pio"


/*
 * jtag_uart_0 configuration
 *
 */

#define ALT_MODULE_CLASS_jtag_uart_0 altera_avalon_jtag_uart
#define JTAG_UART_0_BASE 0x1e0
#define JTAG_UART_0_IRQ 5
#define JTAG_UART_0_IRQ_INTERRUPT_CONTROLLER_ID 0
#define JTAG_UART_0_NAME "/dev/jtag_uart_0"
#define JTAG_UART_0_READ_DEPTH 64
#define JTAG_UART_0_READ_THRESHOLD 8
#define JTAG_UART_0_SPAN 8
#define JTAG_UART_0_TYPE "altera_avalon_jtag_uart"
#define JTAG_UART_0_WRITE_DEPTH 64
#define JTAG_UART_0_WRITE_THRESHOLD 8


/*
 * keycode configuration
 *
 */

#define ALT_MODULE_CLASS_keycode altera_avalon_pio
#define KEYCODE_BASE 0x1b0
#define KEYCODE_BIT_CLEARING_EDGE_REGISTER 0
#define KEYCODE_BIT_MODIFYING_OUTPUT_REGISTER 0
#define KEYCODE_CAPTURE 0
#define KEYCODE_DATA_WIDTH 16
#define KEYCODE_DO_TEST_BENCH_WIRING 0
#define KEYCODE_DRIVEN_SIM_VALUE 0
#define KEYCODE_EDGE_TYPE "NONE"
#define KEYCODE_FREQ 50000000
#define KEYCODE_HAS_IN 0
#define KEYCODE_HAS_OUT 1
#define KEYCODE_HAS_TRI 0
#define KEYCODE_IRQ -1
#define KEYCODE_IRQ_INTERRUPT_CONTROLLER_ID -1
#define KEYCODE_IRQ_TYPE "NONE"
#define KEYCODE_NAME "/dev/keycode"
#define KEYCODE_RESET_VALUE 0
#define KEYCODE_SPAN 16
#define KEYCODE_TYPE "altera_avalon_pio"


/*
 * onchip_memory2_0 configuration
 *
 */

#define ALT_MODULE_CLASS_onchip_memory2_0 altera_avalon_onchip_memory2
#define ONCHIP_MEMORY2_0_ALLOW_IN_SYSTEM_MEMORY_CONTENT_EDITOR 0
#define ONCHIP_MEMORY2_0_ALLOW_MRAM_SIM_CONTENTS_ONLY_FILE 0
#define ONCHIP_MEMORY2_0_BASE 0x0
#define ONCHIP_MEMORY2_0_CONTENTS_INFO ""
#define ONCHIP_MEMORY2_0_DUAL_PORT 0
#define ONCHIP_MEMORY2_0_GUI_RAM_BLOCK_TYPE "AUTO"
#define ONCHIP_MEMORY2_0_INIT_CONTENTS_FILE "nios_system_onchip_memory2_0"
#define ONCHIP_MEMORY2_0_INIT_MEM_CONTENT 1
#define ONCHIP_MEMORY2_0_INSTANCE_ID "NONE"
#define ONCHIP_MEMORY2_0_IRQ -1
#define ONCHIP_MEMORY2_0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define ONCHIP_MEMORY2_0_NAME "/dev/onchip_memory2_0"
#define ONCHIP_MEMORY2_0_NON_DEFAULT_INIT_FILE_ENABLED 0
#define ONCHIP_MEMORY2_0_RAM_BLOCK_TYPE "AUTO"
#define ONCHIP_MEMORY2_0_READ_DURING_WRITE_MODE "DONT_CARE"
#define ONCHIP_MEMORY2_0_SINGLE_CLOCK_OP 0
#define ONCHIP_MEMORY2_0_SIZE_MULTIPLE 1
#define ONCHIP_MEMORY2_0_SIZE_VALUE 16
#define ONCHIP_MEMORY2_0_SPAN 16
#define ONCHIP_MEMORY2_0_TYPE "altera_avalon_onchip_memory2"
#define ONCHIP_MEMORY2_0_WRITABLE 1


/*
 * otg_hpi_address configuration
 *
 */

#define ALT_MODULE_CLASS_otg_hpi_address altera_avalon_pio
#define OTG_HPI_ADDRESS_BASE 0x190
#define OTG_HPI_ADDRESS_BIT_CLEARING_EDGE_REGISTER 0
#define OTG_HPI_ADDRESS_BIT_MODIFYING_OUTPUT_REGISTER 0
#define OTG_HPI_ADDRESS_CAPTURE 0
#define OTG_HPI_ADDRESS_DATA_WIDTH 2
#define OTG_HPI_ADDRESS_DO_TEST_BENCH_WIRING 0
#define OTG_HPI_ADDRESS_DRIVEN_SIM_VALUE 0
#define OTG_HPI_ADDRESS_EDGE_TYPE "NONE"
#define OTG_HPI_ADDRESS_FREQ 50000000
#define OTG_HPI_ADDRESS_HAS_IN 0
#define OTG_HPI_ADDRESS_HAS_OUT 1
#define OTG_HPI_ADDRESS_HAS_TRI 0
#define OTG_HPI_ADDRESS_IRQ -1
#define OTG_HPI_ADDRESS_IRQ_INTERRUPT_CONTROLLER_ID -1
#define OTG_HPI_ADDRESS_IRQ_TYPE "NONE"
#define OTG_HPI_ADDRESS_NAME "/dev/otg_hpi_address"
#define OTG_HPI_ADDRESS_RESET_VALUE 0
#define OTG_HPI_ADDRESS_SPAN 16
#define OTG_HPI_ADDRESS_TYPE "altera_avalon_pio"


/*
 * otg_hpi_cs configuration
 *
 */

#define ALT_MODULE_CLASS_otg_hpi_cs altera_avalon_pio
#define OTG_HPI_CS_BASE 0x1a0
#define OTG_HPI_CS_BIT_CLEARING_EDGE_REGISTER 0
#define OTG_HPI_CS_BIT_MODIFYING_OUTPUT_REGISTER 0
#define OTG_HPI_CS_CAPTURE 0
#define OTG_HPI_CS_DATA_WIDTH 1
#define OTG_HPI_CS_DO_TEST_BENCH_WIRING 0
#define OTG_HPI_CS_DRIVEN_SIM_VALUE 0
#define OTG_HPI_CS_EDGE_TYPE "NONE"
#define OTG_HPI_CS_FREQ 50000000
#define OTG_HPI_CS_HAS_IN 0
#define OTG_HPI_CS_HAS_OUT 1
#define OTG_HPI_CS_HAS_TRI 0
#define OTG_HPI_CS_IRQ -1
#define OTG_HPI_CS_IRQ_INTERRUPT_CONTROLLER_ID -1
#define OTG_HPI_CS_IRQ_TYPE "NONE"
#define OTG_HPI_CS_NAME "/dev/otg_hpi_cs"
#define OTG_HPI_CS_RESET_VALUE 0
#define OTG_HPI_CS_SPAN 16
#define OTG_HPI_CS_TYPE "altera_avalon_pio"


/*
 * otg_hpi_data configuration
 *
 */

#define ALT_MODULE_CLASS_otg_hpi_data altera_avalon_pio
#define OTG_HPI_DATA_BASE 0x180
#define OTG_HPI_DATA_BIT_CLEARING_EDGE_REGISTER 0
#define OTG_HPI_DATA_BIT_MODIFYING_OUTPUT_REGISTER 0
#define OTG_HPI_DATA_CAPTURE 0
#define OTG_HPI_DATA_DATA_WIDTH 16
#define OTG_HPI_DATA_DO_TEST_BENCH_WIRING 0
#define OTG_HPI_DATA_DRIVEN_SIM_VALUE 0
#define OTG_HPI_DATA_EDGE_TYPE "NONE"
#define OTG_HPI_DATA_FREQ 50000000
#define OTG_HPI_DATA_HAS_IN 1
#define OTG_HPI_DATA_HAS_OUT 1
#define OTG_HPI_DATA_HAS_TRI 0
#define OTG_HPI_DATA_IRQ -1
#define OTG_HPI_DATA_IRQ_INTERRUPT_CONTROLLER_ID -1
#define OTG_HPI_DATA_IRQ_TYPE "NONE"
#define OTG_HPI_DATA_NAME "/dev/otg_hpi_data"
#define OTG_HPI_DATA_RESET_VALUE 0
#define OTG_HPI_DATA_SPAN 16
#define OTG_HPI_DATA_TYPE "altera_avalon_pio"


/*
 * otg_hpi_r configuration
 *
 */

#define ALT_MODULE_CLASS_otg_hpi_r altera_avalon_pio
#define OTG_HPI_R_BASE 0x170
#define OTG_HPI_R_BIT_CLEARING_EDGE_REGISTER 0
#define OTG_HPI_R_BIT_MODIFYING_OUTPUT_REGISTER 0
#define OTG_HPI_R_CAPTURE 0
#define OTG_HPI_R_DATA_WIDTH 1
#define OTG_HPI_R_DO_TEST_BENCH_WIRING 0
#define OTG_HPI_R_DRIVEN_SIM_VALUE 0
#define OTG_HPI_R_EDGE_TYPE "NONE"
#define OTG_HPI_R_FREQ 50000000
#define OTG_HPI_R_HAS_IN 0
#define OTG_HPI_R_HAS_OUT 1
#define OTG_HPI_R_HAS_TRI 0
#define OTG_HPI_R_IRQ -1
#define OTG_HPI_R_IRQ_INTERRUPT_CONTROLLER_ID -1
#define OTG_HPI_R_IRQ_TYPE "NONE"
#define OTG_HPI_R_NAME "/dev/otg_hpi_r"
#define OTG_HPI_R_RESET_VALUE 0
#define OTG_HPI_R_SPAN 16
#define OTG_HPI_R_TYPE "altera_avalon_pio"


/*
 * otg_hpi_w configuration
 *
 */

#define ALT_MODULE_CLASS_otg_hpi_w altera_avalon_pio
#define OTG_HPI_W_BASE 0x160
#define OTG_HPI_W_BIT_CLEARING_EDGE_REGISTER 0
#define OTG_HPI_W_BIT_MODIFYING_OUTPUT_REGISTER 0
#define OTG_HPI_W_CAPTURE 0
#define OTG_HPI_W_DATA_WIDTH 1
#define OTG_HPI_W_DO_TEST_BENCH_WIRING 0
#define OTG_HPI_W_DRIVEN_SIM_VALUE 0
#define OTG_HPI_W_EDGE_TYPE "NONE"
#define OTG_HPI_W_FREQ 50000000
#define OTG_HPI_W_HAS_IN 0
#define OTG_HPI_W_HAS_OUT 1
#define OTG_HPI_W_HAS_TRI 0
#define OTG_HPI_W_IRQ -1
#define OTG_HPI_W_IRQ_INTERRUPT_CONTROLLER_ID -1
#define OTG_HPI_W_IRQ_TYPE "NONE"
#define OTG_HPI_W_NAME "/dev/otg_hpi_w"
#define OTG_HPI_W_RESET_VALUE 0
#define OTG_HPI_W_SPAN 16
#define OTG_HPI_W_TYPE "altera_avalon_pio"


/*
 * poolcue configuration
 *
 */

#define ALT_MODULE_CLASS_poolcue altera_avalon_pio
#define POOLCUE_BASE 0x50
#define POOLCUE_BIT_CLEARING_EDGE_REGISTER 0
#define POOLCUE_BIT_MODIFYING_OUTPUT_REGISTER 0
#define POOLCUE_CAPTURE 0
#define POOLCUE_DATA_WIDTH 20
#define POOLCUE_DO_TEST_BENCH_WIRING 0
#define POOLCUE_DRIVEN_SIM_VALUE 0
#define POOLCUE_EDGE_TYPE "NONE"
#define POOLCUE_FREQ 50000000
#define POOLCUE_HAS_IN 0
#define POOLCUE_HAS_OUT 1
#define POOLCUE_HAS_TRI 0
#define POOLCUE_IRQ -1
#define POOLCUE_IRQ_INTERRUPT_CONTROLLER_ID -1
#define POOLCUE_IRQ_TYPE "NONE"
#define POOLCUE_NAME "/dev/poolcue"
#define POOLCUE_RESET_VALUE 0
#define POOLCUE_SPAN 16
#define POOLCUE_TYPE "altera_avalon_pio"


/*
 * reset configuration
 *
 */

#define ALT_MODULE_CLASS_reset altera_avalon_pio
#define RESET_BASE 0x40
#define RESET_BIT_CLEARING_EDGE_REGISTER 0
#define RESET_BIT_MODIFYING_OUTPUT_REGISTER 0
#define RESET_CAPTURE 0
#define RESET_DATA_WIDTH 1
#define RESET_DO_TEST_BENCH_WIRING 0
#define RESET_DRIVEN_SIM_VALUE 0
#define RESET_EDGE_TYPE "NONE"
#define RESET_FREQ 50000000
#define RESET_HAS_IN 1
#define RESET_HAS_OUT 0
#define RESET_HAS_TRI 0
#define RESET_IRQ -1
#define RESET_IRQ_INTERRUPT_CONTROLLER_ID -1
#define RESET_IRQ_TYPE "NONE"
#define RESET_NAME "/dev/reset"
#define RESET_RESET_VALUE 0
#define RESET_SPAN 16
#define RESET_TYPE "altera_avalon_pio"


/*
 * sdram configuration
 *
 */

#define ALT_MODULE_CLASS_sdram altera_avalon_new_sdram_controller
#define SDRAM_BASE 0x10000000
#define SDRAM_CAS_LATENCY 3
#define SDRAM_CONTENTS_INFO
#define SDRAM_INIT_NOP_DELAY 0.0
#define SDRAM_INIT_REFRESH_COMMANDS 2
#define SDRAM_IRQ -1
#define SDRAM_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SDRAM_IS_INITIALIZED 1
#define SDRAM_NAME "/dev/sdram"
#define SDRAM_POWERUP_DELAY 200.0
#define SDRAM_REFRESH_PERIOD 7.8125
#define SDRAM_REGISTER_DATA_IN 1
#define SDRAM_SDRAM_ADDR_WIDTH 0x19
#define SDRAM_SDRAM_BANK_WIDTH 2
#define SDRAM_SDRAM_COL_WIDTH 10
#define SDRAM_SDRAM_DATA_WIDTH 32
#define SDRAM_SDRAM_NUM_BANKS 4
#define SDRAM_SDRAM_NUM_CHIPSELECTS 1
#define SDRAM_SDRAM_ROW_WIDTH 13
#define SDRAM_SHARED_DATA 0
#define SDRAM_SIM_MODEL_BASE 0
#define SDRAM_SPAN 134217728
#define SDRAM_STARVATION_INDICATOR 0
#define SDRAM_TRISTATE_BRIDGE_SLAVE ""
#define SDRAM_TYPE "altera_avalon_new_sdram_controller"
#define SDRAM_T_AC 5.5
#define SDRAM_T_MRD 3
#define SDRAM_T_RCD 20.0
#define SDRAM_T_RFC 70.0
#define SDRAM_T_RP 20.0
#define SDRAM_T_WR 14.0


/*
 * sdram_pll configuration
 *
 */

#define ALT_MODULE_CLASS_sdram_pll altpll
#define SDRAM_PLL_BASE 0x1c0
#define SDRAM_PLL_IRQ -1
#define SDRAM_PLL_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SDRAM_PLL_NAME "/dev/sdram_pll"
#define SDRAM_PLL_SPAN 16
#define SDRAM_PLL_TYPE "altpll"


/*
 * stick_direction configuration
 *
 */

#define ALT_MODULE_CLASS_stick_direction altera_avalon_pio
#define STICK_DIRECTION_BASE 0x20
#define STICK_DIRECTION_BIT_CLEARING_EDGE_REGISTER 0
#define STICK_DIRECTION_BIT_MODIFYING_OUTPUT_REGISTER 0
#define STICK_DIRECTION_CAPTURE 0
#define STICK_DIRECTION_DATA_WIDTH 3
#define STICK_DIRECTION_DO_TEST_BENCH_WIRING 0
#define STICK_DIRECTION_DRIVEN_SIM_VALUE 0
#define STICK_DIRECTION_EDGE_TYPE "NONE"
#define STICK_DIRECTION_FREQ 50000000
#define STICK_DIRECTION_HAS_IN 0
#define STICK_DIRECTION_HAS_OUT 1
#define STICK_DIRECTION_HAS_TRI 0
#define STICK_DIRECTION_IRQ -1
#define STICK_DIRECTION_IRQ_INTERRUPT_CONTROLLER_ID -1
#define STICK_DIRECTION_IRQ_TYPE "NONE"
#define STICK_DIRECTION_NAME "/dev/stick_direction"
#define STICK_DIRECTION_RESET_VALUE 0
#define STICK_DIRECTION_SPAN 16
#define STICK_DIRECTION_TYPE "altera_avalon_pio"


/*
 * sysid_qsys_0 configuration
 *
 */

#define ALT_MODULE_CLASS_sysid_qsys_0 altera_avalon_sysid_qsys
#define SYSID_QSYS_0_BASE 0x1d8
#define SYSID_QSYS_0_ID 0
#define SYSID_QSYS_0_IRQ -1
#define SYSID_QSYS_0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SYSID_QSYS_0_NAME "/dev/sysid_qsys_0"
#define SYSID_QSYS_0_SPAN 8
#define SYSID_QSYS_0_TIMESTAMP 1449376543
#define SYSID_QSYS_0_TYPE "altera_avalon_sysid_qsys"

#endif /* __SYSTEM_H_ */
