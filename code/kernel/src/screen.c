#include "screen.h"
#include "spi.h"
#include <gpio.h>
#include "printk.h"

uint8_t cnt=1;

void delay(uint32_t twait) {
  while(twait--) {
    asm("mov r0, r0");
  }
}

uint8_t _oled_frame_buffer[512];

uint8_t oled_buf_pixel_set(uint32_t row, uint32_t col )
{
int offset,index;
if(col>127 || row>31 ) return 0;
col=127-col;
row=31-row;
index=col+(row/8)*128;
offset=row%8;
_oled_frame_buffer[index]|=1<<offset;
return 1;
}

uint8_t oled_buf_pixel_clr(uint32_t row, uint32_t col )
{
int offset,index;
if(col>127 || row>31 ) return 0;
col=127-col;
row=31-row;
index=col+(row/8)*128;
offset=row%8;
_oled_frame_buffer[index]&=~(1<<offset);
return 1;
}


uint8_t oled_buf_clr()
{
int i;
for(i=0; i<128; i++ ) _oled_frame_buffer[i]=0;
return 1;
}

uint8_t oled_buf_draw()
{
int index;

	oled_start_sequence(); 
        gpio_set(MISO);
      	spi_begin(0, SPI_CLK_DIV_32);

	for(index=0; index<512; index++ )
			spi_transfer(_oled_frame_buffer[index]);  // black pixels

      	spi_end();
return 1;
}

void oled_write_command(unsigned char command) {

    gpio_clr(MISO);
    delay(1000);
    spi_begin(0, SPI_CLK_DIV_64);
    spi_transfer(command);
    spi_end();

}

void oled_write_data(unsigned char data) {
    
    gpio_set(MISO);
    delay(1000);
    spi_begin(0, SPI_CLK_DIV_32);
    spi_transfer(data);
    spi_end();
}

void oled_reset(void) {
  	gpio_config(RESET, GPIO_FUN_OUTPUT);
	gpio_set(RESET);  // should already be high, but just in case
	delay(100000);
	gpio_clr(RESET);
	delay(50000);
	gpio_set(RESET);
}

void oled_scroll_test(void) {
	int i;
	static int cnt=0;
	oled_start_sequence(); 
        gpio_set(MISO);
        spi_begin(0, SPI_CLK_DIV_32);
    		for (i = 0; i < 512; i++) 
			spi_transfer(cnt++);
        spi_end();
	cnt++;
}

void oled_clear_screen(void) {
	int i;
	oled_start_sequence();
        gpio_set(MISO);
        spi_begin(0, SPI_CLK_DIV_32);
    		for (i = 0; i < 512; i++) 
			spi_transfer(0x00);  // black pixels
       spi_end();
}

void oled_init(void) {
    oled_reset(); 
    gpio_config(RESET, GPIO_FUN_OUTPUT);
    gpio_config(MISO, GPIO_FUN_OUTPUT);
    gpio_set(RESET);
    gpio_clr(MISO);
    delay(10000);
 
    spi_master_init(SPI_MODE0, SPI_CLK_DIV_32);
    // This register dump matches the data sheet and
    // a Linux driver SPI capture at startup
    oled_write_command(0xAE);
    oled_write_command(0xD5);
    oled_write_command(0x80);
    oled_write_command(0xA8);
    oled_write_command(0x1F);
    oled_write_command(0xD3);
    oled_write_command(0x00);
    oled_write_command(0x40);
    oled_write_command(0x8D);
    oled_write_command(0x14);
    oled_write_command(0x20);
    oled_write_command(0x00);
    oled_write_command(0xA1);
    oled_write_command(0xC8);
    oled_write_command(0xDA);
    oled_write_command(0x02);
    oled_write_command(0x81);
    oled_write_command(0x8F);
    oled_write_command(0xD9);
    oled_write_command(0xF1);
    oled_write_command(0xDB);
    oled_write_command(0x40);
    oled_write_command(0xA4);
    oled_write_command(0xA6);
    oled_write_command(0xAF);
}

void oled_start_sequence(void) {
    oled_write_command(0x21);
    oled_write_command(0x00);
    oled_write_command(0x7F);
    oled_write_command(0x22);
    oled_write_command(0x00);
    oled_write_command(0x03);
}



