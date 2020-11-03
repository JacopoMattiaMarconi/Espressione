;dato un numero in input, dire se è pari o dispari

;@author:	Marconi Jacopo Mattia
;@date:		05/01/2019
;@version:	1.0

.model small
.stack 200h
.data

num1	db	?	
num2	db	2d
num3	db	00h
dom1	db	'inserire il primo numero: ', 13,10,'$'
aff1	db	'il numero è pari', 13,10,'$'
aff2	db	'il numero è dispari', 13,10,'$'


.code
.startup

mov ax, @data
mov ds, ax

mov ah,09h
mov dx,offset dom1				;fanno apparire a schermo la dom1
int 21h

mov ah,01
int 21h							;il valore inserito da tastiera va a finire nella variabile num1
mov num1,al

mov bl,num2						;muovo num2 nel registro bl
mov bh,num3						;muovo num3 nel registro bh

mov al,num1
div bl

cmp bh,al						;compara bh con al cioè il resto della divisione con 0 se
je vero							;è vero salta a vero se è falsa continua senza saltare

mov ah,09h
mov dx,offset aff2				;fanno apparire a schermo la aff2
int 21h

jmp fine						;salto incondizionato che salta direttamente a fine

vero:

mov ah,09h
mov dx,offset aff1				;fanno apparire a schermo la aff1
int 21h

jmp fine						;salto incondizionato che salta direttamente a fine

fine:

mov al,4ch
mov ah,00h
int 21h

end




