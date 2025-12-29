; Grace

extern dprintf

%macro OPEN_FILE 0
    mov rax, 2
    lea rdi, [rel file]
    mov rsi, 577
    mov rdx, 420
    syscall
%endmacro

%macro WRITE_QUINE 0
    mov rdi, rax
    lea rsi, [rel s]
    mov rdx, 10
    mov rcx, 34
    lea r8,  [rel s]
    xor rax, rax
    call dprintf
%endmacro

%macro EXECUTE_ALL 0
    OPEN_FILE
    WRITE_QUINE
    mov rax, 3
    syscall
%endmacro

section .data
    file db "Grace_kid.s", 0
    s db "; Grace%1$c%1$cextern dprintf%1$c%1$c%%macro OPEN_FILE 0%1$c    mov rax, 2%1$c    lea rdi, [rel file]%1$c    mov rsi, 577%1$c    mov rdx, 420%1$c    syscall%1$c%%endmacro%1$c%1$c%%macro WRITE_QUINE 0%1$c    mov rdi, rax%1$c    lea rsi, [rel s]%1$c    mov rdx, 10%1$c    mov rcx, 34%1$c    lea r8,  [rel s]%1$c    xor rax, rax%1$c    call dprintf%1$c%%endmacro%1$c%1$c%%macro EXECUTE_ALL 0%1$c    OPEN_FILE%1$c    WRITE_QUINE%1$c    mov rax, 3%1$c    syscall%1$c%%endmacro%1$c%1$csection .data%1$c    file db %2$cGrace_kid.s%2$c, 0%1$c    s db %2$c%3$s%2$c, 0%1$c%1$csection .text%1$c    global main%1$c%1$cmain:%1$c    push rbp%1$c    mov rbp, rsp%1$c    EXECUTE_ALL%1$c    leave%1$c    ret", 0

section .text
    global main

main:
    push rbp
    mov rbp, rsp
    EXECUTE_ALL
    leave
    ret