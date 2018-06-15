mess macro msg
lea dx,msg
mov ah,09h
int 21h
endm


.model small
.data
sum db 00h
msg1 db "Enter the values$"
msg2 db 0Ah,0Dh,"The values in array are$"
msg3 db 0Ah,0Dh,"The sum is $"
arr1 db 0Ah,?,0Ah dup('$')
.code
mov ax,@data
mov ds,ax
mov ch,00h
mov cl,0Ah
mess msg1
lea si,arr1
l1:call accept
call addi
mov [si],al
inc si
dec cl
jnz l1


mess msg2
mov cl,0Ah
lea si,arr1
l2:call disp
inc si
dec cl
jnz l2

mess msg3  ;ans in ch;
call dispTwo
mov ah,4ch
int 21h




accept proc near
mov ah,01h
int 21h
ret
endp


disp proc near
mov dl,[si]
mov ah,02h
int 21h
ret
endp




addi proc near
mov bl,al
cmp bl,3Ah
jc l3
sub bl,07h
l3:and bl,0Fh
add ch,bl
ret
endp

dispTwo proc near
mov bh,ch
AND bh,0F0h
rol bh,04h
cmp bh,0Ah
jc l4
add bh,07h
l4:add bh,30h
mov dl,bh
mov ah,02h
int 21h

mov bh,ch
AND bh,0Fh
cmp bh,0Ah
jc l5
add bh,07h
l5:add bh,30h
mov dl,bh
mov ah,02h
int 21h
ret
endp




end
