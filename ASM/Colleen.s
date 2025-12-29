; /*
;     This program will print its own source when run.
; */

global main
extern printf

section .rodata
s db "; /*%1$c;     This program will print its own source when run.%1$c; */%1$c%1$cglobal main%1$cextern printf%1$c%1$csection .rodata%1$cs db %2$c%3$s%2$c, 0%1$c%1$csection .text%1$cfunc:%1$clea rax, [rel s]%1$cret%1$c%1$cmain:%1$center 0, 0%1$c; /*%1$c; This program will print its own source when run.%1$c; */%1$ccall func%1$cmov rdi, rax%1$cmov rsi, 10%1$cmov rdx, 34%1$cmov rcx, rax%1$ccall printf%1$cmov rax, 0%1$cleave%1$cret%1$c", 0

section .text
func:
lea rax, [rel s]
ret

main:
enter 0, 0
; /*
; This program will print its own source when run.
; */
call func
mov rdi, rax
mov rsi, 10
mov rdx, 34
mov rcx, rax
call printf
mov rax, 0
leave
ret
