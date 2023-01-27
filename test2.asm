org 0x7C00
bits 16

main:
	hlt
	jmp main

times 510 - ($-$$) db 0
dw 0xAA55
