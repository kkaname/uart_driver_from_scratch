.syntax unified
.cpu cortex-m4
.thumb

.global Reset_Handler
.global Default_Handler

.section .isr_vector


start_main:
  bl main
  b .

Default_Handler:
  b .
