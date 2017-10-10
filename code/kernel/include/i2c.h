/**
 * @file   i2c.h
 *
 * @brief  I2C interface on rpi 2
 *
 * @date   11 Aug 2016
 * @author James Mackaman <jmackama@andrew.cmu.edu>
 */

#include <kstdint.h>
#include <BCM2836.h>

// I2C pins
/** @brief I2C SDA line pin */
#define I2C1_SDA 2
/** @brief I2C SCL line pin */
#define I2C1_SCL 3

// I2C Clock speeds
/** @ I2C default clock divider value */
#define I2C_CLK_100KHZ 0x5dc

/**
 * @brief initializes the I2C module
 * 
 * @param clk bus clock speed
 */ 
void i2c_master_init(uint16_t clk);

/**
 * @brief writes to I2C device
 * 
 * @param buf pointer to output data buffer
 * @param len length of output data buffer in bytes
 * @param addr slave device address
 */
uint8_t i2c_master_write(uint8_t *buf, uint16_t len, uint8_t addr);
  
/**
 * @brief reads from I2C device
 * 
 * @param buf pointer to input data buffer
 * @param len number of bytes to read
 * @param addr slave device address
 */
uint8_t i2c_master_read(uint8_t *buf, uint16_t len, uint8_t addr);
