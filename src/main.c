#include "stm32f303xc.h"


int main(void) {
    // test code to blink an LED connected to pin PE9 on stm32 board(onboard led)
    // enable GPIOE clock
    RCC->AHBENR |= RCC_AHBENR_GPIOEEN;

    
    GPIOE->MODER &= ~(3 << (2 * 9));     // Clear mode bits for pin 9
    GPIOE->MODER |= (1 << (2 * 9));      // Set mode to 01 = output

    while (1) {
        GPIOE->ODR ^= (1 << 9);          // Toggle PE9
        for (volatile int i = 0; i < 100000; i++);  // Crude delay
    }
}