.model small
.data
r dw 0000h
n1 db 00h
n2 dw 0000h
q dw 0000h
.code
mov ax,@data
mov ds,ax
call accept
mov dx,bx;dx has contents for first bx register
call accept
mov n2,bx  ;this is for ax register
call accept ;which is now the denominator
mov ax,n2
div bx
mov ah,4ch
int 21h

accept proc near
mov ah,01h
int 21h
mov bh,al
cmp bh,3Ah
jc l1
sub bh,07h
l1:and bh,0Fh
rol bh,04h
mov ah,01h
int 21h
cmp al,3Ah
jc l2
sub al,07h
l2:and al,0Fh
add bh,al
mov n1,bh

mov ah,01h
int 21h
mov bl,al
cmp bl,3Ah
jc l3
sub bl,07h
l3:and bl,0Fh
rol bl,04h
mov ah,01h
int 21h
cmp al,3Ah
jc l4
sub al,07h
l4:and al,0Fh
add bl,al

ret
endp
end
