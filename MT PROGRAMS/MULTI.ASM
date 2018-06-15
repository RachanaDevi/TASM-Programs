mess macro msg
lea dx,msg
mov ah,09h
int 21h
endm


disp1 macro no    ;bh as 11

mov ch,no          ;ch has 11
and no,0F0h        ;no has 10
rol no,04h         ;no now has 01
mov cl,no          ;cl has 01
call disp
endm



.model small
.data
n1 db 00h
n2 db 00h
msg1 db "Enter the numerator$"
msg2 db 0Ah,0Dh,"$"
.code
mov ax,@data
mov ds,ax
mov ax,0000h
mov bx,0000h
call accept
mov n1,al
call accept
mul n1
mov bx,ax
disp1 bh
disp1 bl
mov ah,4ch
int 21h

accept proc near
mov ah,01h
int 21h
mov bl,al
mov ah,01h
int 21h
cmp bl,3Ah
jc l1
sub bl,07h
l1:and bl,0Fh
rol bl,04h
cmp al,3Ah
jc l2
sub al,07h
l2:and al,0Fh
add al,bl
ret
endp


disp proc near
cmp cl,0Ah       ;cl has 01
jc hello1
add cl,07h
hello1:add cl,30h  ;cl has 31h
mov dl,cl          ;print
mov ah,02h
int 21h
mov cl,ch          ;cl has again ch  ie 11
and cl,0Fh         ;cl has 01h
cmp cl,0Ah
jc hello2
add cl,07h
hello2:add cl,30h    ;cl has 31h
mov dl,cl
mov ah,02h
int 21h
ret
endp
end


