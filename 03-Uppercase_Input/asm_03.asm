; where data define before compile
section .data
    text1 db "Input a string: "
    len1 equ $-text1
    
    text2 db "Uppercase: "
    len2 equ $-text2
 
; where data allocate for future use
section .bss
    input resb 16

;where actual code goes
section .text
    global _start
_start:
 
    call _printText1
    call _getInput
    call _printText2
    call _printName
 
    mov rax, 60
    mov rdi, 0
    syscall
 
_getInput:
    mov rax, 0
    mov rdi, 0
    mov rsi, input
    mov rdx, 0x20
    syscall
    ret
 
_printText1:
    mov rax, 1
    mov rdi, 1
    mov rsi, text1
    mov rdx, len1
    syscall
    ret
 
_printText2:
    mov rax, 1
    mov rdi, 1
    mov rsi, text2
    mov rdx, len2
    syscall
    ret
 
_printName:
    mov rcx, 0x20
    mov rbp, input
    dec rbp

lowerScan:
    cmp byte [rbp+rcx],0x61                         
    jb Next                        
    cmp byte [rbp+rcx],0x7A         
    ja Next                        
    sub byte [rbp+rcx],0x20        
            

Next:   
    dec rcx                        
    jnz lowerScan
    mov rax, 1
    mov rdi, 1
    mov rsi, input
    mov rdx, 0x30
    syscall
    ret

; syscall sys_write: 0 input, 1 output, 2 error

