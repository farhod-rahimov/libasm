section .text
    global _ft_read
    extern ___error

;ft_read(rdi, rsi, rdx);        ; rdi = fd, rsi = buf, rdx = nbyte

_ft_read:
            mov rax, 0x2000003  ; rax = 0x2000003 -> sys_read;

            syscall             ; call sys_read
            
            jc error            ; if error occurs the carry flag is set to 1
                                ; by default it is 0

            ret                 ; return RAX

error:
            push rax            ; RAX contains errno and we have to save it somewhere.
                                ; I do it in stack
            
            call ___error       ; after calling ___errno RAX will contain the address of errno

            pop QWORD [rax]     ; now we put errno in return value of __errno (pointer to errno)
                                ; QWORD because errno is an int and it is 32 bit size

            mov rax, -1         ; errno is set, now we change the return value of ft_read to -1

            ret                 ; return RAX