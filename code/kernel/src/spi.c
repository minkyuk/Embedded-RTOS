/**
 * @file   spi.c
 *
 * @brief  SPI implementation on rpi 2
 *
 * @date   July 20 2015
 * @author Aaron Reyes <areyes@andrew.cmu.edu>
 */

#include <spi.h>
#include <gpio.h>
#include <kstdint.h>
#include <BCM2836.h>
#include "printk.h"

/* SPI0 MMIO register addresses */
#define SPI0_CS_REG   (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x204000) // SPI Master Control and Status
#define SPI0_FIFO_REG (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x204004) // SPI Master TX and RX FIFOs
#define SPI0_CLK_REG  (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x204008) // SPI Master Clock Divider
#define SPI0_DLEN_REG (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x20400C) // SPI Master Data Length
#define SPI0_LTOH_REG (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x204010) // SPI LOSSI mode TOH
#define SPI0_DC_REG   (volatile uint32_t *)(MMIO_BASE_PHYSICAL + 0x204014) // SPI DMA DREQ Controls

/* Register masks for SPI0_CS_REG (section 10.5) */
#define SPI_LEN_LONG  25 // Enable Long data word in Lossi mode if DMA_LEN is set
#define SPI_DMA_LEN   24 // Enable DMA mode in Lossi mode
#define SPI_CSPOL2    23 // Chip Select 2 Polarity
#define SPI_CSPOL1    22 // Chip Select 1 Polarity
#define SPI_CSPOL0    21 // Chip Select 0 Polarity
#define SPI_RX        20 // RX FIFO Full
#define SPI_RXR       19 // RX FIFO needs Reading
#define SPI_TXD       18 // TX FIFO can accept Data
#define SPI_RXD       17 // RX FIFO contains Data
#define SPI_DONE      16 // transfer Done
#define SPI_LEN       13 // LoSSI enable
#define SPI_REN       12 // Read Enable
#define SPI_ADCS      11 // Automatically Deassert Chip Select
#define SPI_INTR      10 // Interrupt on RXR
#define SPI_INTD      9  // Interrupt on Done
#define SPI_DMAEN     8  // DMA Enable
#define SPI_TA        7  // Transfer Active
#define SPI_CSPOL     6  // Chip Select Polarity
#define SPI_CLEAR_RX  5  // RX FIFO Clear
#define SPI_CLEAR_TX  4  // TX FIFO Clear
#define SPI_CPOL      3  // Clock Polarity
#define SPI_CPHA      2  // Clock Phase
#define SPI_CS1       1  // Chip Select 1
#define SPI_CS0       0  // Chip Select 0

/*
 * NOTE: SPI is always MSB first on rpi
 */

void wait(unsigned int delay) {
  while(delay--) {
    asm("mov r0, r0");
  }
}

void spi_master_init(uint32_t mode, uint32_t clk) {
  unsigned int var;
  
  // set SPI pins according to pg 102
  gpio_config(CE1_N, GPIO_FUN_ALT0);
  gpio_config(CE0_N, GPIO_FUN_ALT0);
  gpio_config(MOSI, GPIO_FUN_ALT0);
  //gpio_config(MISO, GPIO_FUN_ALT0);   // Disabled since MISO is abused by the OLED
  gpio_config(SCLK, GPIO_FUN_ALT0);


 // clear the SPI_CS register
  *SPI0_CS_REG = 0;
  
  // clear TX/RX FIFOs
  *SPI0_CS_REG |= (1 << SPI_CLEAR_RX) | (1 << SPI_CLEAR_TX);

  var = *SPI0_CS_REG;

  // Set mode = 0
  var &= ~((1 << SPI_CPOL) | (1 << SPI_CPHA));

  // Set chip select = 0
  var &= ~((1 << SPI_CS0) | (1 << SPI_CS1));

  // Set polarity = HIGH
  var |= (1 << SPI_CSPOL);

  *SPI0_CS_REG = var;

  // set the clock rate
  *SPI0_CLK_REG = clk;
  wait(10000);
}

void spi_begin(uint8_t cmdMode, uint32_t clk) {
  unsigned int var;
  
  // set SPI pins according to pg 102
//XXX  gpio_config(CE1_N, GPIO_FUN_ALT0);
// XXX  gpio_config(CE0_N, GPIO_FUN_ALT0);
// XXX  gpio_config(MISO, GPIO_FUN_OUTPUT);
  //gpio_config(MISO, GPIO_FUN_ALT0);
// XXX  gpio_config(MOSI, GPIO_FUN_ALT0);
// XXX  gpio_config(SCLK, GPIO_FUN_ALT0);


  // clear the SPI_CS register
  *SPI0_CS_REG = 0;
  
  // clear TX/RX FIFOs
  *SPI0_CS_REG |= (1 << SPI_CLEAR_RX) | (1 << SPI_CLEAR_TX);

  var = *SPI0_CS_REG;

  // Set mode = 0
  var &= ~((1 << SPI_CPOL) | (1 << SPI_CPHA));

  // Set chip select = 0
  var &= ~((1 << SPI_CS0) | (1 << SPI_CS1));

  // Set polarity = HIGH
  var |= (1 << SPI_CSPOL);

  *SPI0_CS_REG = var;

  // set the clock rate
  *SPI0_CLK_REG = clk;
}


void spi_end(void) {
  // clear TA
  *SPI0_CS_REG &= ~(1 << SPI_TA);
}


uint8_t spi_transfer(uint8_t data) {
  unsigned int var = 0;
  unsigned int ret = 0;
  
  var = *SPI0_CS_REG;
  // Clear RX and TX fifos
  var |= (1 << SPI_CLEAR_RX) | (1 << SPI_CLEAR_TX);
  // Set TA
  var |= (1 << SPI_TA);
  *SPI0_CS_REG = var;

  // Wait for TXD
  while (!((*SPI0_CS_REG) & (1 << SPI_TXD))) {
    wait(1);
  }

  // Write to TX fifo
  *SPI0_FIFO_REG = data;

  // Wait for done to be set
  while (!((*SPI0_CS_REG) & (1 << SPI_DONE))) {
    wait(1);
  }

  // Read RX fifo
  ret = *SPI0_FIFO_REG;

  // Set TA = 0
  var = *SPI0_CS_REG;
  var &= ~(1 << SPI_TA);
  *SPI0_CS_REG = var;

  return ret;

}
