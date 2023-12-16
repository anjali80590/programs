.MODEL SMALL
.STACK 100H
.DATA
INPUT DB "ENTER ANY ASCII CHARACTER: $"
MESSG DB 0AH,0DH,"BINARY EQUIVALENT IS : $"

.CODE

START:
        
        MOV AX,@DATA
        MOV DS,AX
        MOV DX,OFFSET INPUT
        MOV AH,09H
        INT 21H

        MOV AH,01H
        INT 21H
        MOV BL,AL
        
        MOV AH,09H
        MOV DX,OFFSET MESSG
        INT 21H

        MOV CX,8

        BIN_CONV:
          SHL BL,1
          JC DISPLAY1
        DISPLAY0:
          MOV DL,30H
          JMP DISPLAY2
        DISPLAY1:
          MOV DL,31H

        DISPLAY2:
         MOV AH,02H
         INT 21H
       LOOP BIN_CONV
MOV AH,4CH
INT 21H
END
