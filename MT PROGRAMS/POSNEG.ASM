mess macro msg
lea dx,msg
mov ah,09h
int 21h
endm

.model small
.data
pos db 00h
nega db 00h
arr1 db 81h,01h,04h,06h,07h,90h,81h,90h,88h,81h
msg1 db 0Ah,0Dh,"The no of positive integers is=$"
msg2 db 0Ah,0Dh,"The no of negative integers is=$"
.code
mov ax,@data
mov ds,ax
mov cl,0Ah
lea si,arr1
l1:mov al,[si]
   and al,80h
   jz posit
        inc nega
        jmp l3
   posit:inc pos
   l3:inc si
   dec cl
jnz l1

mess msg1
mov bl,pos
call disp

mess msg2
mov bl,nega
call disp

mov ah,4ch
int 21h


disp proc near
cmp bl,0Ah
jc l2
add bl,07h
l2:add bl,30h
mov dl,bl
mov ah,02h
int 21h
ret
endp

end
