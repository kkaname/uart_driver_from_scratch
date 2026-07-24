PREFIX	= arm-none-eabi-

CC		= $(PREFIX)gcc
OBJCOPY	= $(PREFIX)objcopy 
SIZE	= $(PREFIX)size 
GDB		= gdb-multiarch
OOCD 		= openocd

MCU = cortex-m4
FPU = 

TARGET = uart_driver 
LINKER = linker/linkerscript.ld

LDFLAGS = -T $(LINKER) -wl,--gc-sections -nostdlib

SRCS = src/main.c 	\
	   src/uart.c	\
	   src/ring_buffer.c
SRCS += startup/startup.s



all: $(TARGET).bin 

$(TARGET).bin: $(TARGET).elf 
  $(OBJCOPY) -O binary $< $@

$(TARGET).elf: $(SRCS)
  $(CC) $(LDFLAGS)     $^ -o $@
  $(SIZE) $@


.PHONY: clean flash

flash: 


clean: 
	rm -f *.elf *.bin *.o
  
