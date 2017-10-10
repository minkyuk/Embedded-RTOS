/**
 * @file   spi.h
 *
 * @brief  SPI interface with rpi 2
 *
 * @date   July 25th 2015
 * @author Aaron Reyes <areyes@andrew.cmu.edu>
 */

#ifndef _SPI_H_
#define _SPI_H_

#include <kstdint.h>

/*
 * SPI pins on pi 2
 */

/** @brief SPI chip enable 1 */
#define CE1_N 7
/** @brief SPI chip enable 0 */
#define CE0_N 8
/** @brief SPI MISO */
#define MISO  9
/** @brief SPI MOSI */
#define MOSI  10
/** @brief SPI clock */
#define SCLK  11
/** @brief SPI reset */
#define RESET 16

/*
 * input modes for spi_master_init()
 */

/** @brief CPOL = 0, CPHA = 0 */
#define SPI_MODE0 0
/** @brief CPOL = 0, CPHA = 1 */
#define SPI_MODE1 1
/** @brief CPOL = 1, CPHA = 0 */
#define SPI_MODE2 2
/** @brief CPOL = 1, CPHA = 1 */
#define SPI_MODE3 3

/*
 * SPI clock times for spi_master_init()
 */

/** @brief 3.814697260kHz */
#define SPI_CLK_DIV_65536 0
/** @brief 7.629394531kHz */
#define SPI_CLK_DIV_32768 32768
/** @brief 15.25878906kHz */
#define SPI_CLK_DIV_16384 16384
/** @brief 30/51757813kHz */
#define SPI_CLK_DIV_8192  8192
/** @brief 61.03515625kHz */
#define SPI_CLK_DIV_4096  4096
/** @brief 122.0703125kHz */
#define SPI_CLK_DIV_2048  2048
/** @brief 244.140625kHz */
#define SPI_CLK_DIV_1024  1024
/** @brief 488.28125kHz */
#define SPI_CLK_DIV_512   512
/** @brief 976.5625MHz */
#define SPI_CLK_DIV_256   256
/** @brief 1.953125MHz */
#define SPI_CLK_DIV_128   128
/** @brief 3.90625MHz */
#define SPI_CLK_DIV_64    64
/** @brief 7.8125MHz */
#define SPI_CLK_DIV_32    32
/** @brief 15.625MHz */
#define SPI_CLK_DIV_16    16
/** @brief 31.25MHz */
#define SPI_CLK_DIV_8     8
/** @brief 62.5MHz */
#define SPI_CLK_DIV_4     4
/** @brief 125MHz */
#define SPI_CLK_DIV_2     2
/** @brief 3.814697260kHz */
#define SPI_CLK_DIV_1     1

/*
 * SPI chip select values for spi_master_chip_sel()
 */

/** @brief Select device 0 */
#define SPI_CS_0 0
/** @brief Select device 1 */
#define SPI_CS_1 1
/** @brief Select device 2 */
#define SPI_CS_2 2

/*
 * SPI chip select polarities for spi_master_chip_sel() (active high or low)
 */

/** @brief CS lines are active low */
#define SPI_CS_ACTIVE_LOW  0
/** @brief CS lines are active high */
#define SPI_CS_ACTIVE_HIGH 1

/**
 * @brief initializes SPI given the mode and clock divider
 *
 * @param mode the mode (SPI_MODE0, ...1, ...2, ...3)
 * @param clk the clock rate (SPI_CLK_DIV_...)
 */
void spi_master_init(uint32_t mode, uint32_t clk);

/**
 * @brief begin an SPI transaction. should be called before
 *        spi_master_transfer()
 */
void spi_begin(uint8_t cmdMode, uint32_t clk);

/**
 * @brief end an SPI transaction. should be called after all
 *        spi_master_transfer() calls have finished.
 */
void spi_end(void);

/**
 * @brief transfers/receives data using SPI
 *
 * @param data the byte to send
 * @return the byte received
 */
uint8_t spi_transfer(uint8_t data);

#endif /* _SPI_H_ */
