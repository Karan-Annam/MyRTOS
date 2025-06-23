    .section .isr_vector, "a", %progbits
    .global _estack
    .global Reset_Handler

    .word _estack               /* Initial stack pointer */
    .word Reset_Handler         /* Reset handler */
    .word Default_Handler       /* NMI */
    .word Default_Handler       /* HardFault */
    .word Default_Handler       /* MemManage */
    .word Default_Handler       /* BusFault */
    .word Default_Handler       /* UsageFault */
    .word 0                     /* Reserved */
    .word 0                     /* Reserved */
    .word 0                     /* Reserved */
    .word 0                     /* Reserved */
    .word Default_Handler       /* SVCall */
    .word Default_Handler       /* DebugMonitor */
    .word 0                     /* Reserved */
    .word Default_Handler       /* PendSV */
    .word Default_Handler       /* SysTick */
    /* IRQs */
    .rept (48)                  /* Adjust count as needed for your MCU's IRQs */
    .word Default_Handler
    .endr

    .text
    .thumb_func
    .global Reset_Handler
Reset_Handler:
    /* Copy .data section from flash to RAM */
    ldr r0, =_sidata
    ldr r1, =_sdata
    ldr r2, =_edata

copy_data:
    cmp r1, r2
    bge copy_done
    ldr r3, [r0]
    add r0, r0, #4
    str r3, [r1]
    add r1, r1, #4
    b copy_data

copy_done:

    /* Zero .bss section */
    ldr r0, =_sbss
    ldr r1, =_ebss
    movs r2, #0

zero_bss:
    zero_bss:
    cmp r0, r1
    bge zero_done
    str r2, [r0]
    add r0, r0, #4
    b zero_bss
zero_done:

    /* Call main */
    bl main

    /* If main returns, loop forever */
hang:
    b hang

    .thumb_func
Default_Handler:
    b hang
