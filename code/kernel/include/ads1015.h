/**
 * @file   ads1015.h
 *
 * @brief  ADS1050 interface over I2C
 *
 * @date   12 Aug 2016
 * @author James Mackaman <jmackama@andrew.cmu.edu>
 */

#ifndef _ADS1050_H_
#define _ADS1050_H_

#include <kstdint.h>

/**
 * @brief initialize ADS1015
 */
void adc_init(void);

/**
 * @brief read a value from the ADC
 *
 * @param channel 0 through 3
 * @return the value read from the ADC
 */
uint16_t adc_read(uint8_t channel);

#endif /* _ADC_DRIVER_H_ */
