
.model small
.data

msg1 db "Enter any binary no.$"
msg2 db "Its equivalent ascii character:$"

.code
mov ax,@data
mov ds,ax
mov ah,09h
mov dx,offset msg1
int 21h
mov bl,00h
mov cl,08h

input1:
mov ah,01h
int 21h
sub al,30h

shl bl,1
add bl,al
loop input1

mov ah,09h
mov dx,offset msg2
int 21h
mov ah,02h
mov dl,bl
int 21h
mov ah,4ch
int 21h
end
