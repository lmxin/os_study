; nasm boot.asm -o boot.bin
; ndisasm -o 0x7c00 boot.bin > disboot.asm     
; bximage -q -mode=create -fd=1.44M a.img
; dd if=boot.bin of=a.img bs=512 count=1 conv=notrunc
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
times 510-($-$$)  db 0
      dw      0xaa55










    