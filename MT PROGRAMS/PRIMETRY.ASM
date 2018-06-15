mess macro msg
lea dx,msg
mov ah,09h
int 21h
endm

.model small
.data
n1 db 02h
q db 00h
msg1 db 0Ah,0Dh,"Enter the number=$"
primeMsg db 0Ah,0Dh,"Th no is prime$"
notPrimeMsg db 0Ah,0Dh,"The no is not prime$"
.code
mov ax,@data
mov ds,ax
mov n1,02h
mess msg1
call accept
mov cl,bl
loop1:
   mov ah,00h
   mov al,bl
   div n1
   cmp ah,00h
        je stat1

   inc n1
   dec cl
   jnz loop1
        stat1:cmp n1,bl
        je stat2
mess notPrimeMsg
jmp endjump
       stat2:mess primeMsg
endjump:mov ah,4ch
int 21h

accept proc near
mov ah,01h
int 21h
cmp al,3Ah
jc l2
sub al,07h
l2:and al,0Fh
mov bl,al
rol bl,04h
mov ah,01h
int 21h
cmp al,3Ah
jc l3
sub al,07h
l3:and al,0Fh
add bl,al
ret
endp


disp proc near
add bl,30h
mov dl,bl
mov ah,02h
int 21h
ret
endp
end
