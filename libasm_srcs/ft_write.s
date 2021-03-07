section .text
    global _ft_write
    extern ___error

;Linux system call table: http://www.staroceans.org/e-book/System%20Call%20Table.html
;Example: sys_write`s rax is 4, but for macOS assembler we should 
;write instead rax = 4 rax = 0x2000004

;ft_write(rdi, rsi, rdx));      ; rdi = fd, rsi = buf, rdx = nbyte

_ft_write:
            mov rax, 0x2000004  ; rax = 0x2000004 -> sys_write;

            syscall             ; call sys_write
            
            jc error            ; if error occurs the carry flag is set to 1
                                ; by default it is 0

            ret                 ; return RAX

error:
            push rax            ; RAX contains errno and we have to save it somewhere.
                                ; I do it in stack
            
            call ___error       ; after calling ___errno RAX will contain the address of errno

            pop QWORD [rax]     ; now we put errno in return value of __errno (pointer to errno).
                                ; QWORD because errno is an int and it is 32 bit size

            mov rax, -1         ; errno is set, now we change the return value of ft_read to -1

            ret                 ; return RAX