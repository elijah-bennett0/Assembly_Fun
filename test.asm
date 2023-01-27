org 0x7C00              ; where to start in memory
bits 16                 ; using 16 for simplicity

main:
	string: db "TEST", 0
	mov ax, string
	jmp print
	hlt

print:
	.init:
		mov si, ax
		.loop:
			cmp byte [si], 0
			je end
			mov al, [si]
			mov ah, 0x0E
			int 0x10
			inc si
			jmp .loop

end:
	ret

cls:
	pusha
	mov al, 0x03
	mov ah, 0x00
	int 0x10
	popa
	ret

times 510 - ($-$$) db 0
dw 0xAA55
