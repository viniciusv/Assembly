TITLE Enquanto 5
;Faça um programa que valide a entrada de um número inteiro que representa um mês do ano, 
;ou seja, obrigue o usuário a entrar um número entre 1 e 12.

.386
.model flat,stdcall
include c:\masm32\include\kernel32.inc
include c:\masm32\include\Irvine32.inc
includelib c:\masm32\lib\kernel32.lib
includelib c:\masm32\lib\Irvine32.lib

.data
msg  BYTE "Entre com um numero: ",0
msg2 BYTE "mes valido",0
msg3 byte "mes invalido",0
n SDWORD ?

.code
principal:
inicio:
	mov edx, OFFSET msg		
	call WriteString		
	call ReadInt
	cmp eax,1	   			
	jge E	       			
	jmp senao      			
E:
	cmp eax,12				
	jle entao				
	jmp senao				
entao:
	mov edx,OFFSET msg2 	
	call WriteString
	jmp fimse		
senao:
	mov edx,OFFSET msg3
	call WriteString
	call Crlf
	jmp inicio
fimse:
	INVOKE ExitProcess,0

END principal

