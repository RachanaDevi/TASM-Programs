mess macro msg
lea dx,msg
mov ah,09h
int 21h
endm

acceptMac  macro m1
call accept
mov m1,cl
endm

dispMac macro m2
mov cl,m2
call disp
endm

.model small
.data
n1 dw 0000h
n2 db 00h
n3 db 00h
msg1 db 0Ah,0Dh,"Enter the values for ax= $"
msg2 db 0Ah,0Dh,"Enter the values for bx= $"
msg3 db 0Ah,0Dh,"ANSWER=$"
msg4 db 0Ah,0Dh,"$"
msg5 db 0Ah,0Dh,"Value is=$"
.code
mov ax,@data
mov ds,ax
mess msg1
acceptMac bh
acceptMac bl
mov n1,bx
mess msg5
dispMac bh
dispMac bl
mess msg2
acceptMac bh
acceptMac bl
mess msg4
mess msg5
dispMac bh
dispMac bl
mov ax,n1
mul bx
mov n1,ax
mov bx,dx
mess msg3
dispMac bh
dispMac bl

mov bx,n1

dispMac bh
dispMac bl

mov ah,4ch
int 21h


proc accept near
mov ah,01h
int 21h
mov cl,al
cmp cl,3Ah
jc l1
sub cl,07h
l1:and cl,0Fh
rol cl,04h
mov n2,cl
mov ah,01h
int 21h
mov cl,al
cmp cl,3Ah
jc l2
sub cl,07h
l2:and cl,0Fh
add cl,n2  ;bh=23
ret
endp

disp proc near
mov n3,cl
and cl,0F0h  ;23 gives cl as 2
rol cl,04h    ;cl now has 02 
cmp cl,0Ah
jc d1
add cl,07h
d1:add cl,30h  ;cl has 32
mov dl,cl
mov ah,02h
int 21h
mov cl,n3       ;cl again has 23
and cl,0Fh      ;cl has 3
cmp cl,0Ah
jc d2
add cl,07h
d2:add cl,30h   ;cl has 33h
mov dl,cl
mov ah,02h
int 21h
ret
endp




end
