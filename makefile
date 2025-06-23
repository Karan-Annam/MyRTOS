#temp for now, change later
CC = "C:\Program Files (x86)\Arm GNU Toolchain arm-none-eabi\14.2 rel1\bin\arm-none-eabi-gcc.exe"


CFLAGS = -mcpu=cortex-m4 -mthumb -nostdlib -Os

# link script
LDSCRIPT = linker.ld

# Include paths
INCLUDES = -Iinclude \
           -ISTM32/Include \
           -ISTM32/Include1

# src files
SRCS = src/main.c src/RTOS.s

# output executable file
OUT = blink.elf

# build target
all: $(OUT)

# Link 
$(OUT): $(SRCS)
	$(CC) $(CFLAGS) $(INCLUDES) -T $(LDSCRIPT) $^ -o $@

# Clean 
clean:
	rm -f $(OUT)
