org 0x7C00 ; where to start in memory
bits 16 ; 16 bit asm for simplicity

print:
	mov ah, 0x13
	mov al, 

cls:
	pusha ; push all
	mov al, 0x03
	mov ah, 0x00
	int 0x10
	popa ; pop all
	ret

main:
	call cls
	hlt
	jmp main

.string: db "TEST", 0x00, 0x0D, 0x0A
times 510 - ($-$$) db 0 ; fill empty space with 0 so file is exactly 512 bytes (size of a bootloader)
dw 0xAA55 ; bios check
