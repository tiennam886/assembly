SECTION .text
    GLOBAL _start

    _start:
        ; print name
        mov rax,1     ; sys_write
        mov rdi,1     ; stdout
        mov rsi,hello  ; start address of hello
        mov rdx,len ; length of hello
        syscall

        ; exit program
        mov rax,60    ; sys_exit
        mov rdi,0     ; success
        syscall

SECTION .data
    hello DB "Hello, World!",10
    ; DB : define bytes, to define raw bytes of data to insert
    ; 10 : new line same as "\n"
    
    len equ $-hello
    