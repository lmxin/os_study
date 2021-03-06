; nasm boot.asm -o boot.bin
; ndisasm -o 0x7c00 boot.bin > disboot.asm     
; cp ../a.img .
; dd if=boot.bin of=a.img bs=512 count=1 conv=notrunc
; cp ../bochsrc .
; bochs -q -f bochsrc
    org     07c00h
    mov     ax, cs
    mov     ds, ax
    mov     es, ax
    call    DispStr
    jmp     $
DispStr:
    mov     ax, BootMessage
    mov     bp, ax
    mov     cx, 16
    mov     ax, 01301h
    mov     bx, 000ch
    mov     dl, 0
    int     10h
    ret  
BootMessage:    
      db  "Hello, os world!"
;因为我们在第0章已经建立好了空白的引导软盘,
;所以原书结尾的填充代码可以去掉了.