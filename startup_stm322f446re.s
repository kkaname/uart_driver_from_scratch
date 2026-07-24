.syntax unified
.cpu cortex m-4
.thumb

.global Reset_Handler
.global Default_Handler 

.section .isr_vector, "a", %progbits
  .word _estack
  .word Reset_Handler 
  .word Default_Handler     /* NMI Handler */
  .word Hard_Handler        /*  */
  .word 0
  .word 0
  .word 0
  .word 0, 0, 0, 0
  .word 0
  .word 0, 0
  .word 0
  .word 0
  .word USART_IRQHandler 

.section text, "ax"
Reset_Handler: 
  ldr r0, =_sdata
  ldr r1, =_edata
  ldr r2, =_etext 
copy_loop:
  cmp r0, r1 
  bge zero_bss


zero_bss: 

  
Reset_Handler:
  ldr
