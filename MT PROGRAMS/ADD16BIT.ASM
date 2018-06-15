func macro n1
call accept ;accept and convert into single digit ie 38 into 08
rol al,04h  ;rol 08 to 80
mov n1,al   ;move to n1->80
call accept ;accept digit which will be in one's place eg=02
add n1,al   ;add 80+2 =82
endm

mess macro msg     ;message display
lea dx,msg
mov ah,09h
int 21h
endm

decodn macro no1
mov al,no1   ;mov contents of bh  into al
and al,0F0h  ;get the digit in ten's place
rol al,04h   ;rol it into unit's place
call disp    ;disp converts into hex value and displays the digit
mov al,no1   ;now getting the no in one's place
and al,0Fh
call disp    ;convert into hex value
endm

.model small
.data
n1 dw 0000h
sum dw 0000h
msg1 db 0Ah,0Dh,"Enter the values$"
msg2 db 0Ah,0Dh,"The display=$"
msg3 db 0Ah,0Dh,"The Answer=$"
msg4 db 0Ah,0Dh,"$"
.code
mov ax,@data
mov ds,ax

mess msg1

func bh
func bl

mess msg4

func ch
func cl

mess msg2
mess msg4

decodn bh
decodn bl

mess msg4

decodn ch
decodn cl

mess msg3
adc bx,cx
jnc l1
mov dl,31h
mov ah,02h
int 21h

l1:decodn bh
decodn bl

mov ah,4ch
 int 21h

accept proc near
mov ah,01h
int 21h
cmp al,3Ah
jc l2
sub al,07h
l2:and al,0Fh
ret
endp


disp proc near
cmp al,0Ah
jc l3
add al,07h
l3:add al,30h
mov dl,al
mov ah,02h
int 21h
ret
endp

end



