# Embedded-RTOS
Implemented priority-scheduling RTOS on bare-metal.


Simple UNIX kernel with optimized scheduling algorithms as well as interrupt style that can only be seen in Real-Time Operating Systems(RTOS). Normally, the scheduler for regular OS is focused on the throughput of the performance. RTOS on the other hand runs according to bounded latency to guarantee for system calls and operations, including thread switching time, interrupt response time etc. This results in a much dynamic scheduling system where the page switching is using polling system. (after setting up the handlers)

For this project, I had to write Optimized Supervisor (Supervisor.S) in Assembly which sets the behavior of supervisor state of OS, along with schedulers in (kernel.c) and page switching in Optimization folder, (optimize_me.S).

All other functions included in the folders except for SPI API(hardware API), prink, I2C API, screen, are the code of my own. All software was run on a bare-metal Raspberry Pi, with medium controller of UART.
I am happy to expand obstacles and other projects that excited me in the future. I have explored many system areas from RTOS to Distributed Systems.
