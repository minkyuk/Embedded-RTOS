/**
 * @file   uart.c
 *
 * @brief  lower level hardware interactions for uart on pi
 *
 * @date   September 25th, 2016
 * @author Calvin Giroud <cgiroud@andrew.cmu.edu>, Minkyu Kim <minkyuk@andrew.cmu.edu>
 */

#include <uart.h>
#include <gpio.h>
#include <BCM2836.h>
#include <kstdint.h>

#define AUXENB_REG      (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x215004)
#define AUX_MU_IO_REG   (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x215040)
#define AUX_MU_IER_REG  (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x215044)
#define AUX_MU_IIR_REG  (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x215048)
#define AUX_MU_LCR_REG  (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x21504C)
#define AUX_MU_LSR_REG  (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x215054)
#define AUX_MU_CNTL_REG (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x215060)
#define AUX_MU_STAT_REG (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x215064)
#define AUX_MU_BAUD     (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x215068)
/**
 * RECENT EDIT: Got rid of AUX_MU_CNTL_REG control flow.
 */

/**
 * @brief initializes UART to 115200 baud in 8-bit mode
 */
void uart_init(void) 
{
  // set Mini UART enable
  *AUXENB_REG = 0x1;
  
  // configure GPIO pullups
  gpio_set_pull(RX_PIN, GPIO_PULL_DISABLE);
  gpio_set_pull(TX_PIN, GPIO_PULL_DISABLE);

  // set GPIO pins to correct function
  gpio_config(RX_PIN, GPIO_FUN_ALT5);
  gpio_config(TX_PIN, GPIO_FUN_ALT5);
  
  // disable interrupts
  *AUX_MU_IER_REG = 0x0;

  // set UART to 8-bit mode
  *AUX_MU_LCR_REG = 0x3;

  // set baud_reg
  *AUX_MU_BAUD = 270; 
}

/**
 * @brief closes UART
 */
void uart_close(void) 
{

  // disable access to UART
  *AUXENB_REG = 0x0;
}

/**
 * @brief sends a byte of UART
 *
 * @param byte the byte to send
 */
void uart_put_byte(uint8_t byte) 
{
  // wait until transmitter is empty
  while (!((*AUX_MU_LSR_REG >> 6) & 0x1));

  // set byte in IO reg
  *AUX_MU_IO_REG = byte;
}

/**
 *
 * @return the byte received
 */
uint8_t uart_get_byte(void) 
{
  // wait for receiver to become idle
  while (((*AUX_MU_LSR_REG >> 5) & 0x1));

  return *AUX_MU_IO_REG;
}
