.model small
.data
n1 db 00h
n2 db 00h
arr1 db 03h,?,03h dup('$')
arr2 db 03h,?,03h dup('$')
.code
mov ax,@data
mov ds,ax
mov cl,03h
lea si,arr1
loop1:call accept
mov [si],bl
inc si
dec cl
jnz loop1

mov cl,03h
lea di,arr2
lea si,arr1 ;ans in arr1
loop2:call accept
add [si],bl
mov [di],bl
inc si
inc di
dec cl
jnz loop2
call disp
mov ah,4ch
int 21h



accept proc near
mov ah,01h
int 21h
mov bl,al
cmp bl,3Ah
jc l1
sub bl,07h
l1:and bl,0Fh
rol bl,04h
mov ah,01h
int 21h
cmp al,3Ah
jc l2
sub al,07h
l2:and al,0Fh
add bl,al
ret
endp


disp proc near
lea si,arr1
mov cl,03h
loop3:mov bl,[si]
        and bl,0F0h
        rol bl,04h
        cmp bl,0Ah
        jc innerLoop1
        add bl,07h
        innerLoop1:add bl,30h
        mov dl,bl
        mov ah,02h
        int 21h
        mov bl,[si]
        and bl,0Fh
        cmp bl,0Ah
        jc innerLoop2
        add bl,07h
        innerLoop2:add bl,30h
        mov dl,bl
        mov ah,02h
        int 21h
inc si
dec cl
jnz loop3
ret
endp

end

