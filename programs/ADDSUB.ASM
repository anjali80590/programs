.model small
.stack
.data
SIZE_ARR DB ?
ARRAY1 DB 10 DUP(?)
ARRAY2 DB 10 DUP(?)
MSG DB "ENTER SIZE OF THE ARRAY: $"
A1 DB 0DH,0AH,"ENTER THE ELEMENTS OF FIRST ARRAY :$"
A2 DB 0DH,0AH,"ENTER THE ELEMENTS OF SECOND ARRAY :$"
ADD_RES DB 0DH,0AH,"SUM OF TWO ARRAYS IS :$"
SUB_RES DB 0DH,0AH,"SUBTRACTING SECOND ARRAY FROM FIRST GIVES :$"

.CODE
START:

 MOV AX,@DATA
 MOV DS,AX
 MOV DX,OFFSET MSG
 MOV AH,09H
 INT 21H
 MOV AH,01H
 INT 21H
 SUB AL,30H
 MOV SIZE_ARR,AL

 MOV DX, OFFSET A1
 MOV AH,09H
 INT 21H

 
 MOV SI,0
 MOV CL,SIZE_ARR

 READ1:
       MOV AH,01H
       INT 21H
       SUB AL,30H
       MOV ARRAY1[SI],AL
       INC SI
       MOV DL,20H   ; 20H FOR SPACE
       MOV AH,02H
       INT 21H
       LOOP READ1

  MOV DX,OFFSET A2
  MOV AH,09H
  INT 21H

  MOV SI,0
  MOV CL,SIZE_ARR
  READ2:
       MOV AH,01H
       INT 21H
       SUB AL,30H
       MOV ARRAY2[SI],AL
       INC SI
       MOV DL,20H
       MOV AH,02H
       INT 21H
       LOOP READ2
  MOV DX,OFFSET ADD_RES
  MOV AH,09H
  INT 21H
  MOV SI,0
  MOV CL,SIZE_ARR
  MOV AH,0
  ADD_Arrays:
       MOV AL,ARRAY1[SI]
       MOV BL,ARRAY2[SI]
       
       INC SI
       ADD AL,BL
       
       MOV AH,0
       AAA
       
       ADD AH,30H
       ADD AL,30H
       MOV BH,AH
       MOV BL,AL
       MOV DL,BH
       MOV AH,02H
       INT 21H

       MOV DL,BL
       MOV AH,02H
       INT 21H
       
       MOV DL,20H
       MOV AH,02H
       INT 21H 
              
       LOOP ADD_Arrays
   
  MOV DX,OFFSET SUB_RES
  MOV AH,09H
  INT 21H
  MOV SI,0
  MOV CL,SIZE_ARR
  MOV AH,0
  SUB_Arrays:
       MOV AL,ARRAY1[SI]
       MOV BL,ARRAY2[SI]
       
       INC SI
       SUB AL,BL
       
       MOV AH,0
       AAS
       
       ADD AH,30H
       ADD AL,30H
       MOV BH,AH
       MOV BL,AL
       MOV DL,BH
       MOV AH,02H
       INT 21H

       MOV DL,BL
       MOV AH,02H
       INT 21H
       
       MOV DL,20H
       MOV AH,02H
       INT 21H 
              
       LOOP SUB_Arrays
   
   
   MOV AH,4CH
   INT 21H
end
