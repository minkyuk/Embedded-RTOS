/**
 * @file   i2c.c
 *
 * @brief  I2C implementation on rpi 2
 *
 * @date   October 1st, 2016
 * @author Calvin Giroud <cgiroud@andrew.cmu.edu>, Minkyu Kim <minkyuk@andrew.cmu.edu>
 */

#include <BCM2836.h>
#include <kstdint.h>
#include <i2c.h>
#include <gpio.h>

/** @brief base address of the BSC1 */
#define BSC1_BASE 0x804000

/** @brief I2C control register */
#define BSC_C     (volatile uint32_t *)(MMIO_BASE_PHYSICAL + BSC1_BASE + 0x0)
/** @brief I2C status register */
#define BSC_S     (volatile uint32_t *)(MMIO_BASE_PHYSICAL + BSC1_BASE + 0x4)
/** @brief I2C dlen register */
#define BSC_DLEN  (volatile uint32_t *)(MMIO_BASE_PHYSICAL + BSC1_BASE + 0x8)
/** @brief I2C slave address register */
#define BSC_A     (volatile uint32_t *)(MMIO_BASE_PHYSICAL + BSC1_BASE + 0xC)
/** @brief I2C FIFO data register */
#define BSC_FIFO  (volatile uint32_t *)(MMIO_BASE_PHYSICAL + BSC1_BASE + 0x10)
/** @brief I2C clock divider register */
#define BSC_DIV   (volatile uint32_t *)(MMIO_BASE_PHYSICAL + BSC1_BASE + 0x14)

/** @brief maximum address (assume 7-bit I2C addressing) */
#define ADDR_MAX  127
/** @brief maximum length (in bytes) */
#define LEN_MAX   16

/**
 * @brief initializes the I2C module
 * 
 * @param clk bus clock speed
 */ 
void i2c_master_init(uint16_t clk) 
{
  // configure GPIO pullups
  gpio_set_pull(I2C1_SDA, GPIO_PULL_DISABLE);
  gpio_set_pull(I2C1_SCL, GPIO_PULL_DISABLE);

  // set GPIO pins to correct function
  gpio_config(I2C1_SDA, GPIO_FUN_ALT0);
  gpio_config(I2C1_SCL, GPIO_FUN_ALT0);
  
  // set clk divider
  *BSC_DIV = clk;
}

/**
 * @brief writes to I2C device
 * 
 * @param buf pointer to output data buffer
 * @param len length of output data buffer in bytes
 * @param addr slave device address
 */
uint8_t i2c_master_write(uint8_t *buf, uint16_t len, uint8_t addr) 
{
  // enable i2c controller
  *BSC_C = 0x8000;

  // check failure cases
  if (addr > ADDR_MAX || len > LEN_MAX)
  {
    return 1;
  }

  // set slave address
  *BSC_A = addr;
 
  // write len to DLEN
  *BSC_DLEN = len;

  // write into FIFO
  uint16_t i;
  for (i = 0; i < len; i++)
  {
    *BSC_FIFO = buf[i];
  }
 
  // start transfer
  *BSC_C = 0x8080;

  // wait for transfer to DONE state
  while (!((*BSC_S >> 1) & 0x1));

  // clear DONE bit
  *BSC_S &= ~(0x1 << 1);

  // clear FIFO
  *BSC_C = 0x8030;

  // update status register 
  uint16_t temp_s = *BSC_S;
  *BSC_S = temp_s;

  uint16_t temp_c = *BSC_C;
  *BSC_C = temp_c;
   
  return 0;
} 
  
/**
 * @brief reads from I2C device
 * 
 * @param buf pointer to input data buffer
 * @param len number of bytes to read
 * @param addr slave device address
 */
uint8_t i2c_master_read(uint8_t *buf, uint16_t len, uint8_t addr) 
{
  // enable i2c controller, read mode
  *BSC_C = 0x8001;
  
  // check failure cases
  if (addr > ADDR_MAX || len > LEN_MAX)
  {
    return 1;
  }

  // set slave address
  *BSC_A = addr;
   
  // write len to DLEN
  *BSC_DLEN = len;
   
  // start transfer
  *BSC_C = 0x8081;

  // wait for transfer to DONE state
  while (!((*BSC_S >> 1) & 0x1));

  // read into buffer
  uint16_t i;
  for (i = 0; i < len; i++)
  {
    buf[i] = *BSC_FIFO;
  }

  // clear DONE bit
  *BSC_S &= ~(0x1 << 1);

  // clear FIFO
  *BSC_C = 0x8030;
  
  // update Status Register
  uint16_t temp_s = *BSC_S;
  *BSC_S = temp_s;
  
  uint16_t temp_c = *BSC_C;
  *BSC_C = temp_c;

  return len;
}
