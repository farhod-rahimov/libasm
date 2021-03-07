section .text
    global _ft_strdup
    extern _ft_strlen
    extern _ft_strcpy
    extern _malloc
    extern ___error

;ft_strdup(rdi);                ; rdi = s1

_ft_strdup:
            cmp rdi, 0          ; check if RDI (s1) is not NULL
            
            je return_null      ; if RDI is NULL return NULL

            call _ft_strlen     ; this function returns the str_len in RAX
            
            inc rax             ; increment RAX (for '\0')
            
            jmp malloc

malloc:
            push rdi            ; further we will use RDI for 'malloc' and 
                                ; in order NOT to LOSE s1 we should push it to stack
                                ; or save it in another free register. I push it to stack
            
            mov rdi, rax        ; how many bytes should we allocate memmory
                                ; number of bytes we already have in RAX, but we have to move it to RDI
                                ; because malloc works only with RDI (malloc(rdi))
            
            call _malloc        ; the allocated memmory returned in RAX

            cmp rax, 0          ; check is memmory allocated successfully

            jc error            ; if error occurs the carry flag is set to 1
                                ; by default it is 0
                                ; we could also write 'je' instead 'jc'
           
            je return_null 
            
            pop rsi             ; PUSHED s1 to stack we put to RSI. RSI is the second argument of
                                ; ft_strcpy(char *dst, char *src) or ft_strcpy(rdi, rsi)
            
            mov rdi, rax        ; move the allocated memmory in RAX to RDI because ft_strcpy needs it
                                ; RDI = char *dst
            
            call _ft_strcpy     ; do a copy

            ret                 ; return RAX
                                ; ft_strcpy has already moved RDI to RAX

return_null:
            mov rax, 0          ; set return value to 0 (NULL)

            ret                 ; return RAX

error:
            push rax            ; RAX contains errno and we have to save it somewhere.
                                ; I do it in stack
                                
            call ___error       ; after calling ___errno RAX will contain the address of errn

            pop QWORD[rax]      ; now we put errno in return value of __errno (pointer to errno).
                                ; QWORD because errno is an int and it is 32 bit size

            mov rax, 0          ; set return value to 0 (NULL)

            ret                 ; return RAX