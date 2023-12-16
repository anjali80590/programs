.model small
.386
.stack 50H
.data
d1 db 0AH,'Enter 1st no ',24H
d2 db 0AH,'Enter 2nd no ',24H
d3 db 0AH,'Difference of the two numbers is ',24H
.code
start:
        MOV AX,@DATA
        MOV DS,AX
        MOV DX,offset d1
        MOV AH,09H
        INT 21H
        CALL Input
        MOV EBP,EBX
        MOV DX,offset d2
        MOV AH,09H
        INT 21H
        CALL Input
        MOV DX,offset d3
        MOV AH,09H
        INT 21H
        SUB EBP,EBX
        MOV EBX,EBP
        CALL Output
        MOV AH,4CH
        INT 21H

        Input PROC NEAR
        MOV EBX,00000000H
        MOV EDX,00000000H
        MOV CL,1CH
        MOV CH,08H
L1:
        MOV AH,01H
        INT 21H
        SUB AL,30H
        MOV DL,AL
        SHL EDX,CL
        ADD EBX,EDX
        MOV EDX,00000000H
        SUB CL,04H
        SUB CH,01H
        JNZ L1
        RET
        Input ENDP

        Output PROC NEAR
L4:
        MOV EBP,0F0000000H
        MOV CL,1CH
        MOV CH,08H
L5:
        MOV EDX,EBX
        AND EDX,EBP
        SHR EDX,CL
        ADD DL,30H
        MOV AH,02H
        INT 21H
        MOV AL,CL
        MOV CL,04H
        SHR EBP,CL
        MOV CL,AL
        SUB CL,04H
        SUB CH,01H
        JNZ L5
        RET
        Output ENDP
        end start

