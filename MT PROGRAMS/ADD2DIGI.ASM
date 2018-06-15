mess macro msg
lea dx,msg
mov ah,09h
int 21h
endm


.model small
.data
n1 db 00h
msg1 db 0Ah,0Dh,"Enter the number$"
msg2 db 0Ah,0Dh,"The Answer is$"
.code
mov ax,@data
mov ds,ax
mess msg1
call accept
mov n1,al
call accept
mess msg2
add n1,al       ;just do sub n1,al as n1 is the first no then al
;mov al,n1
jnc l5
mov dl,31h
mov ah,02h
int 21h
l5:mov al,n1
call disp
mov ah,4ch
int 21h


disp proc near
mov n1,al
and al,0F0h
rol al,04h
cmp al,0Ah
jc l3
add al,07h
l3:add al,30h
mov dl,al
mov ah,02h
int 21h
mov al,n1
and al,0Fh
cmp al,0Ah
jc l4
add al,07h
l4:add al,30h
mov dl,al
mov ah,02h
int 21h
ret
endp


accept proc near
mov ah,01h   ;32
int 21h
mov bl,al     ;BL HAS 32
mov ah,01h    ;AL HAS 33
int 21h
cmp bl,3Ah    ;CMP 32 AND 3A
jc l1
sub bl,07h
l1:and bl,0Fh   ;BL HAS 02H
rol bl,04h       ;BL HAS 20H
cmp al,3Ah       ;33 AND 3A
jc l2
sub al,07h
l2:and al,0Fh    ;03H
add al,bl        ;23
ret
endp

end


