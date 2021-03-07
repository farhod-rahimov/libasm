section .text
    global _ft_strlen

;ft_strlen(rdi);                            ; rdi = *str

_ft_strlen:
                mov rax, 0                  ; RAX = 0. ft_strlen returns RAX
                jmp compare                 ; jump to compare

increment_rax:
                inc rax                     ; RAX++

compare:
                cmp byte [rdi + rax], 0     ; comparison between str[RAX] and '\0'

                jne increment_rax           ; if str[RAX] != 0 jump to increment_rax
                                            ; else go to return_strlen

return_strlen:
                ret                         ; return RAX