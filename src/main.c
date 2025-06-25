#include "stm32f303xc.h"

void delay(volatile unsigned int t) {
    while (t--) {
        // Prevent optimization
        for (volatile unsigned int i = 0; i < 10000; i++){};
    }
}


int main(void) {

     RCC->AHBENR |= RCC_AHBENR_GPIOEEN;     // Enable GPIOE clock
    if (!(RCC->AHBENR & RCC_AHBENR_GPIOEEN)) {
        while (1);
    }

    GPIOE->MODER &= ~(0b11 << (11                                                                                                                                                * 2));   // Clear PE12 mode
    GPIOE->MODER |=  (0b01 << (11 * 2));

    GPIOE->ODR |= (1 << 11); 

   
    // GPIOE->MODER &= ~(0b11 << (12 * 2));   // Clear PE12 mode
    // GPIOE->MODER |=  (0b01 << (12 * 2));   // Set PE12 to output

    // GPIOE->MODER &= ~(0b11 << (13 * 2));   // Clear PE13 mode
    // GPIOE->MODER |=  (0b01 << (13 * 2));   // Set PE13 to output

    // while (1) {
    //     GPIOE->ODR |= (1 << 12);           // Turn PE12 ON
    //     GPIOE->ODR &= ~(1 << 13);          // Turn PE13 OFF
    //     delay(100);

    //     GPIOE->ODR &= ~(1 << 12);          // Turn PE12 OFF
    //     GPIOE->ODR |= (1 << 13);           // Turn PE13 ON
    //     delay(100);
    // }
}


