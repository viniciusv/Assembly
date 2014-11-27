TITLE Enquanto 3
;Faça um programa que leia um número inteiro e mostre se o número é par ou impar. 
;Implemente dois procedimentos: um para a leitura do número e outro para mostrar se o número é par ou impar.

.386
.model flat,stdcall
include c:\masm32\include\kernel32.inc
include c:\masm32\include\Irvine32.inc
includelib c:\masm32\lib\kernel32.lib
includelib c:\masm32\lib\Irvine32.lib

.data
msg  BYTE "Entre com um numero: ",0
msg2  BYTE "par: ",0
msg3 BYTE "impar: ",0
resto SDWORD ?
n SDWORD ?

.code
principal PROC
	call lenum
	call parimpar
principal ENDP

lenum PROC
	mov edx, OFFSET msg		
	call WriteString		
	call ReadInt
	mov n,eax	 		
lenum ENDP

parimpar PROC
	mov ebx,2
	div ebx
	mov resto,edx	
	cmp resto,0
	je se
	jmp senao
se:
	mov eax,n
	mov edx, OFFSET msg2
	call WriteString
	call WriteDec
	jmp fimse
senao:
	mov eax,n
	mov edx, OFFSET msg3
	call WriteString
	call WriteDec
fimse:
	INVOKE ExitProcess,0
parimpar ENDP

END principal
