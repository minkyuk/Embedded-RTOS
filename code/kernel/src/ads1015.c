/**
 * @file   ads1015.c
 *
 * @brief  I2C driver for ads1015
 *
 * @date   October 1st, 2016
 * @author Calvin Giroud <cgiroud@andrew.cmu.edu>, Minkyu Kim <minkyuk@andrew.cmu.edu>
 */

#include <kstdint.h>
#include "i2c.h"

/** @brief addr connected to Vdd 0b1001001 */
#define SLAVE_ADDR  0x49

/**
 * @brief initialize ADS1015
 */
void adc_init(void) 
{
  i2c_master_init(I2C_CLK_100KHZ);
}

/**
 * @brief read a value from the ADC
 *
 * @param channel 0 through 3
 * @return the value read from the ADC
 */
uint16_t adc_read(uint8_t channel) 
{
  uint8_t MSB_config;

  // set config MUX bits based on channel
  switch (channel)
  {
    case 0:
      MSB_config = 0x70;
      break;
    case 1:
      MSB_config = 0x60;
      break;
    case 2:
    case 3:
    default:
      return 1;
  }
  
  // write to config register
  uint16_t len = 3;
  uint8_t buf[3];
  buf[0] = 0x1;
  buf[1] = MSB_config;
  buf[2] = 0x83;
  i2c_master_write(buf, len, SLAVE_ADDR);

  // write to pointer register
  len    = 1;
  buf[0] = 0x0;
  i2c_master_write(buf, len, SLAVE_ADDR);
  
  // read from conversion register
  len = 2;
  i2c_master_read(buf, len, SLAVE_ADDR);

  // combine results
  uint16_t bufMSB = buf[0];
  uint16_t bufLSB = buf[1];
  return (bufMSB << 8) | bufLSB;
}
