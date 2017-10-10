#ifndef _SCREEN_H_
#define _SCREEN_H_

#include "spi.h"

#define SSD1306B_DCDC_CONFIG_PREFIX_8D          (0x8D)
#define SSD1306B_DCDC_CONFIG_7p5v_14            (0x14)
#define SSD1306B_DCDC_CONFIG_6p0v_15            (0x15)
#define SSD1306B_DCDC_CONFIG_8p5v_94            (0x94)
#define SSD1306B_DCDC_CONFIG_9p0v_95            (0x95)
#define SSD1306B_DISPLAY_OFF_YES_SLEEP_AE       (0xAE)
#define SSD1306B_DISPLAY_ON_NO_SLEEP_AF         (0xAF)
#define SSD1306B_CLOCK_DIVIDE_PREFIX_D5         (0xD5)
#define SSD1306B_MULTIPLEX_RATIO_PREFIX_A8      (0xA8)
#define SSD1306B_DISPLAY_OFFSET_PREFIX_D3       (0xD3)
#define SSD1306B_DISPLAY_START_LINE_40          (0x40)
#define SSD1306B_SEG0_IS_COL_0_A0               (0xA0)
#define SSD1306B_SEG0_IS_COL_127_A1             (0xA1)
#define SSD1306B_SCAN_DIR_UP_C0                 (0xC0)
#define SSD1306B_SCAN_DIR_DOWN_C8               (0xC8)
#define SSD1306B_COM_CONFIG_PREFIX_DA           (0xDA)
#define SSD1306B_COM_CONFIG_SEQUENTIAL_LEFT_02  (0x02)
#define SSD1306B_COM_CONFIG_ALTERNATE_LEFT_12   (0x12)
#define SSD1306B_COM_CONFIG_SEQUENTIAL_RIGHT_22 (0x22)
#define SSD1306B_COM_CONFIG_ALTERNATE_RIGHT_32  (0x32)
#define SSD1306B_CONTRAST_PREFIX_81             (0x81)
#define SSD1306B_PRECHARGE_PERIOD_PREFIX_D9     (0xD9)
#define SSD1306B_VCOMH_DESELECT_PREFIX_DB       (0xDB)
#define SSD1306B_VCOMH_DESELECT_0p65xVCC_00     (0x00)
#define SSD1306B_VCOMH_DESELECT_0p71xVCC_10     (0x10)
#define SSD1306B_VCOMH_DESELECT_0p77xVCC_20     (0x20)
#define SSD1306B_VCOMH_DESELECT_0p83xVCC_30     (0x30)
#define SSD1306B_ENTIRE_DISPLAY_FORCE_ON_A5     (0xA5)
#define SSD1306B_ENTIRE_DISPLAY_NORMAL_A4       (0xA4)
#define SSD1306B_INVERSION_NORMAL_A6            (0xA6)
#define SSD1306B_INVERSION_INVERTED_A7          (0xA7)


uint8_t oled_buf_pixel_set(uint32_t row, uint32_t col );
uint8_t oled_buf_pixel_clr(uint32_t row, uint32_t col );
uint8_t oled_buf_clr();
uint8_t oled_buf_draw();


void delay(uint32_t twait);
void oled_write_command(unsigned char command);
void oled_write_data(unsigned char data);
void oled_reset(void);
void oled_clear_screen(void);
void oled_init(void);
void oled_start_sequence(void);
void oled_scroll_test(void);

#endif /* _SCREEN_H_ */

