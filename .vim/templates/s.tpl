    .data
    .text
.section .text
.globl _start
    .type   _start, @function
_start:
    pushl   %ebp
    movl    %esp, %ebp

    movl    %ebp, %esp
    popl    %ebp
    ret
