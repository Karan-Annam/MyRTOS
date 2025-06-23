    .section .isr_vector, "a", %progbits
    .global _estack
    .global Reset_Handler

    .word _estack           /* stack pointer */
    .word Reset_Handler     /* eset andler */
    .word Default_Handler   /* NMI */
    .word Default_Handler   /* HardFault */
    .word Default_Handler   /* MemManage */
    .word Default_Handler   /* BusFault */
    .word Default_Handler   /* UsageFault */
    .word 0                 /* Reserved */
    .word 0                 /* Reserved */
    .word 0                 /* Reserved */
    .word 0                 /* Reserved */
    .word Default_Handler   /* SVCall */
    .word Default_Handler   /* DebugMonitor */
    .word 0                 /* Reserved */
    .word Default_Handler   /* PendSV */
    .word Default_Handler   /* SysTick */
    /* Add IRQ handlers as needed */

    .text
    .global Reset_Handler
Reset_Handler:
    /* Copy .data from flash to RAM */
    ldr r0, =_sidata
    ldr r1, =_sdata
    ldr r2, =_edata
copy_data:
    cmp r1, r2
    ittt lt
    ldrlt r3, [r0], #4
    strlt r3, [r1], #4
    blt copy_data

    /* Zero .bss */
    ldr r0, =_sbss
    ldr r1, =_ebss
    mov r2, #0
zero_bss:
    cmp r0, r1
    it lt
    strlt r2, [r0], #4
    blt zero_bss

    /* Call main */
    bl main

    /* Trap if main returns */
    b .

/* Default handler just loops */
Default_Handler:
    b .
