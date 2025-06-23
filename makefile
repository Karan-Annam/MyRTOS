# Toolchain
CC = "C:\Program Files (x86)\Arm GNU Toolchain arm-none-eabi\14.2 rel1\bin\arm-none-eabi-gcc.exe"

# Flags
CFLAGS = -mcpu=cortex-m4 -mthumb -nostdlib -Os

# Linker script
LDSCRIPT = linker.ld

# Include paths (adjust if these folder names change)
INCLUDES = -Iinclude \
           -ISTM32/Include \
           -ISTM32/Include1

# Source files
SRCS = src/main.c src/startup_stm32f303xc.s

# Output file
OUT = blink.elf

# Default build target
all: $(OUT)

# Link rule
$(OUT): $(SRCS)
	$(CC) $(CFLAGS) $(INCLUDES) -T $(LDSCRIPT) $^ -o $@

# Clean rule
clean:
	rm -f $(OUT)
