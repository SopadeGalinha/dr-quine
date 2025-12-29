; i = 5

section .data
	check_file db "Sully_5.s", 0
	sed_cmd db "sed 's/; i = [0-9]/; i = %d/;s/mov r12d, [0-9]/mov r12d, %d/;s/Sully_5/Sully_%d/' Sully.s > Sully_%d.s", 0
	compile_fmt db "nasm -f elf64 Sully_%d.s -o Sully_%d.o && gcc -no-pie Sully_%d.o -o Sully_%d 2>/dev/null", 0
	execute_fmt db "./Sully_%d", 0

section .bss
	cmd_buf resb 512

section .text
	global main
	extern sprintf, system, open

main:
	push rbp
	mov rbp, rsp
	sub rsp, 512

	mov r12d, 5

	; Check if we should decrement by trying to open Sully_5.s
	lea rdi, [rel check_file]
	mov esi, 0
	call open
	cmp eax, 0
	jl .skip_dec
	; File exists, close it and decrement
	mov edi, eax
	call system
	dec r12d

.skip_dec:
	cmp r12d, 0
	jl .end

	; Create new file with sed
	lea rdi, [rbp - 512]
	lea rsi, [rel sed_cmd]
	mov edx, r12d
	mov ecx, r12d
	mov r8d, r12d
	mov r9d, r12d
	xor eax, eax
	call sprintf
	lea rdi, [rbp - 512]
	call system

	; Compile
	lea rdi, [rbp - 256]
	lea rsi, [rel compile_fmt]
	mov edx, r12d
	mov ecx, r12d
	mov r8d, r12d
	mov r9d, r12d
	xor eax, eax
	call sprintf
	lea rdi, [rbp - 256]
	call system

	; Execute if counter >= 0
	cmp r12d, 0
	jl .end

	lea rdi, [rbp - 128]
	lea rsi, [rel execute_fmt]
	mov edx, r12d
	xor eax, eax
	call sprintf
	lea rdi, [rbp - 128]
	call system

.end:
	xor eax, eax
	leave
	ret
