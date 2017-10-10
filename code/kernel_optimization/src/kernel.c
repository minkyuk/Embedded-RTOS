/**
 * @file   kernel.c
 *
 * @brief  lab1 optimization part
 *
 * @date   9/20/2016
 * @author Kyuin Lee <kyuinl@andrew.cmu.edu>
 */

#include <arm.h>
#include <kstdint.h>
#include <uart.h>
#include <printk.h>
#include <tic_toc.h>
#include <printk.h>

#define SIZE 500
int array1[SIZE],array2[SIZE];

void optimize_me(int array[SIZE]);
void unoptimized(int array[SIZE]);

void kernel_main(void)
{
  int i,good=1;
  uint32_t timerValue;

  uart_init();
  //initialize the two arrays
  for (i=0; i<SIZE; i++) 
  {
    array1[i] = i;
    array2[i] = i;
  }
  
  //Start measuring ticks for optimized function
  printk("+++++++Optimized Function+++++++\n");
  tic();
  optimize_me(array1);
  timerValue = toc();
  printk("%d\n",timerValue);

  //Start measuring ticks for unoptimized function
  printk("+++++++Unoptimized Function+++++++\n");
  tic();
  unoptimized(array2);
  timerValue = toc();
  printk("%d\n",timerValue);

  //checking the correctness.
  for (i=0; i<SIZE; i++) 
  {
    if (array1[i]!=array2[i])
    {   
      //Print failed
      printk("+++++++Test Failed+++++++\n");
      good = 0;
      break;
    }
  }
  if (good) 
  {
    //Print passed
    printk("+++++++Test Passed+++++++\n");
  }
  while (1) 
  {
    delay_cycles(100000);
  };
}
