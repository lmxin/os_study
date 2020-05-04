; 本代码的目的是建立一个空白的引导扇区,前510字节都为0,然后510到511的内容为0xaa55
; 它生成的a.img可以作为以后各章的模板
; nasm empty_loader.asm -o empty_loader.bin
; bximage -q -mode=create -fd=1.44M a.img
; dd if=empty_loader.bin of=a.img bs=512 count=1 conv=notrunc
times 510 db 0
	dw 0xaa55










    