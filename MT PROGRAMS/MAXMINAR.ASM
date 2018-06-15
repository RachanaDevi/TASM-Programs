mess macro msg
lea dx,msg
mov ah,09h
int 21h
endm

.model small
.data
msg1 db 0Ah,0Dh, "Enter the values$"
msg2 db 0Ah,0Dh,"The values are$"
msg3 db 0Ah,0Dh,"The maximum no is=$"
msg4 db 0Ah,0Dh,"The minimum no is=$"
arr1 db 0Ah,?,0AH dup('$')
max db ?
.code
mov ax,@data
mov ds,ax
mov bl,00h
mov cl,0Ah
lea si,arr1
mess msg1
l1:call accept
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

call findMax
call findMin
mov ah,4ch
int 21h

disp proc near
mov dl,[si]
mov ah,02h
int 21h
ret
endp

accept proc near
mov ah,01h
int 21h
mov [si],al
ret
endp

findMax proc near

mov cl,0Ah
lea si,arr1
l3:mov al,[si]
cmp al,bl
jl l4
mov bl,al
l4:inc si
dec cl
jnz l3
mess msg3

mov dl,bl
mov ah,02h
int 21h
ret
endp

findMin proc near

mov cl,0Ah
lea si,arr1
l5:mov al,[si]
cmp al,bl
jg l6
mov bl,al
l6:inc si
dec cl
jnz l5
mess msg3

mov dl,bl
mov ah,02h
int 21h
ret
endp



end


