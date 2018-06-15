.model small
.data
n1 db 00h
arr1 db 03h,?,03h dup('$')
.code

mov ax,@data
mov ds,ax
mov es,ax
mov cl,08h
mov si,0E000h
l1:call accept
mov [si],bl
inc si
dec cl
jnz l1

;moving into another location
mov cl,08h
mov di,0B001h
mov si,0E000h
l4:mov bh,[si]
mov [di],bh
inc si
inc di
dec cl
jnz l4


mov di,0B001h
mov cl,08h
l3:mov bh,[di]

add bh,30h

mov dl,bh
mov ah,02h
int 21h
inc di
dec cl
jnz l3

mov ah,4ch
int 21h


accept proc near
mov ah,01h
int 21h
mov bl,al
cmp bl,3Ah
jc l2
sub bl,07h
l2:and bl,0Fh
ret
endp
end

