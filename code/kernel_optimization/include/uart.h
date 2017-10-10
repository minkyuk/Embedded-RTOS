/**
 * @file   uart.h
 *
 * @brief  hardware interaction for UART on pi
 *
 * @date   July 25th 2015
 * @author Aaron Reyes <areyes@andrew.cmu.edu>
 */

#ifndef _UART_H_
#define _UART_H_

#include <kstdint.h>

/** @brief GPIO UART RX pin */
#define RX_PIN 15
/** @brief GPIO UART TX pin */
#define TX_PIN 14

/**
 * @brief initializes UART to 115200 baud in 8-bit mode
 */
void uart_init(void);

/**
 * @brief closes UART
 */
void uart_close(void);

/**
 * @brief sends a byte over UART
 *
 * @param byte the byte to send
 */
void uart_put_byte(uint8_t byte);

/**
 * @brief reads a byte over UART
 *
 * @return the byte received
 */
uint8_t uart_get_byte(void);

#endif /* _UART_H_ */