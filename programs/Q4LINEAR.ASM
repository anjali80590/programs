.model small
.data

arrSize db 0
arr db 10 dup(?)
inputSize db 0AH,"Enter the size of array $"
inputArr db 0ah,"Enter the elements of array $"
inputElem db 0ah,"Enter the element you want to search for $"
elem db 0
posE db 0ah,"Element found at position $"
notFound db 0ah,"Element not found!$"
pos dw 0

.code
mov ax,@data
mov ds,ax

mov dx,offset inputSize
mov ah,09h
int 21h

mov ah,01h ; a character is read in AL
int 21h

sub al,30h    ; subtract 30h (hexa rep of 0) to get the numeric value
mov arrSize,al

mov dx,offset inputArr
mov ah,09h
int 21h

mov cl,arrSize
mov si,0

enterArray:
        mov ah,01h
        int 21h

        sub al,30h
        mov arr[si],al
        inc si

        mov dl,20h  ; for space
        mov ah,02h
        int 21h

        loop enterArray

mov dx,offset inputElem
mov ah,09h
int 21h

mov ah,01h
int 21h

sub al,30h
mov elem,al

mov cl,arrSize
mov si,0

linearSearch:
        mov al,arr[si]
        inc si
        cmp al,elem
        mov pos,si
        jz found
        loop linearSearch

mov dx,offset notFound
mov ah,09h
int 21h
mov ah,4ch
int 21h

found:
        mov dx,offset posE
        mov ah,09h
        int 21h
        add pos,30h
        mov dx,pos
        mov ah,02h
        int 21h
mov ah,4ch
int 21h
end
