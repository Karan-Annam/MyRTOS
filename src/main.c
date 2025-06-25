#include "stm32f303xc.h"

void delay(volatile uint32_t count) {
    while (count--) __asm("nop");
}

int main(void) {
    // 1. Enable clock to GPIOD
    RCC->AHBENR |= RCC_AHBENR_GPIODEN;

    // 2. Set PD13 as output
    GPIOD->MODER &= ~(0b11 << (13 * 2)); // Clear
    GPIOD->MODER |=  (0b01 << (13 * 2)); // Set to output (01)

    while (1) {
        GPIOD->ODR ^= (1 << 13); // Toggle PD13 (green LED)
        delay(1000000);
    }
}
