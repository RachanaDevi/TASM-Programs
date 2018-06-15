mess macro msg
lea dx,msg
mov ah,09h
int 21h
endm

accMac macro m1
call accept1
mov m1,cl
endm

.model small
.data
n1 db 00h
r db 00h
q db 00h
msg1 db 0Ah,0Dh,"Enter the value for 16bit $"
msg2 db 0Ah,0Dh,"Enter the value for 8bit $"
.code
mov ax,@data
mov ds,ax
mess msg1
 accMac bh
 accMac bl
;mov dx,bx
mess msg2
mov dx,bx
 accMac bl
mov ax,dx
mov bh,00h
div bl    ;ax/bl
mov ah,4ch
int 21h

accept1 proc near
mov ah,01h
int 21h
mov cl,al
cmp cl,3Ah
jc l1
sub cl,07h
l1:and cl,0Fh
rol cl,04h
mov n1,cl
mov ah,01h
int 21h
mov cl,al
cmp cl,3Ah
jc l2
sub cl,07h
l2:and cl,0Fh
add cl,n1
ret
endp
end


