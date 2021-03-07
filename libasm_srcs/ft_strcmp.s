section .text
    global _ft_strcmp

;ft_strcmp(rdi, rsi);                       ; RDI = *s1, RSI = *s2

_ft_strcmp:
	            mov rax, 0                  ; RAX = 0. RAX we use as i (iterator)

loop:
	            mov bl, byte[rdi + rax]     ; BL = s1[RAX]. BL we use as tmp_char
											; instead BL can be any another free register

	            mov cl, byte[rsi + rax]     ; CL = s2[RAX]. CL we use as tmp_char
											; instead CL can be any another free register
	            
                cmp bl, cl                  ; comparison between CL and BL
                
                jl return_less              ; if BL < CL jump to return_less
                
                jg return_great             ; if BL > CL jump to return_great
                
                je equal                    ; if BL == CL jump to equal

equal:
                cmp cl, 0                   ; comparison between CL and '\0'
                
                je return_0                 ; if CL == '\0' it means that s1 and s2 end
                                            ; and we return 0
                
                inc rax                     ; else RAX++
                
                jmp loop                    ; and jump again to loop

return_0:
                mov rax, 0                  ; RAX = 0
                                            ; ft_strcmp returns RAX.
                
                ret                         ; return RAX


return_great:
                cmp bl, 0                   ; comparison between BL and '\0'
                
                je return_less             ; if BL == '\0' jump return_less
                
                mov rax, 1                  ; RAX = 1
                
                ret                         ; return RAX

return_less:
                cmp cl, 0                   ; comparison between CL and '\0'

                je return_great             ; if CL == '\0' jump return_great

                mov rax, -1                 ; RAX = -1
                
                ret                         ; return RAX