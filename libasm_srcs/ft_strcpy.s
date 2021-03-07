section .text
	global _ft_strcpy

;ft_strcpy(rdi, rsi);						; RDI = *dst, RSI = *src

_ft_strcpy:
				mov rax, 0					; RAX = 0. RAX we use as i (iterator)
				
				cmp rsi, 0					; comparison between *str and 0 or *str and NULL
				
				je	return_dst				; if *str == NULL jump to return_dst
				
				jmp copy_char				; else jump to copy_char

increment_rax:
				inc rax						; RAX++

copy_char:
	       	 	mov cl, BYTE [rsi + rax]	; CL = src[RAX]. CL we use as tmp_char
											; instead CL can be any another free register
				
				mov BYTE [rdi + rax], cl	; dst[RAX] = CL
				
				cmp cl, 0					; comparison between CL and '\0'
				
				je return_dst				; if CL == '\0' jump return_dst
				
				jmp increment_rax			; else jump to increment_rax

return_dst:
				mov rax, rdi				; ft_strcpy returns RAX 
											; thatswhy we need to move RDI (*dst) to RAX
				
				ret							; return RAX