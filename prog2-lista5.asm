TITLE Enquanto 2
;Faça um programa que leia uma sequência de números inteiros sem sinal terminada por 0 e mostre a média dos 
;números, sem se importar com a parte fracionária. Implemente dois procedimentos: um para a leitura de cada número 
;e outro para o cálculo e exibição da média.

.386
.model flat,stdcall
include c:\masm32\include\kernel32.inc
include c:\masm32\include\Irvine32.inc
includelib c:\masm32\lib\kernel32.lib
includelib c:\masm32\lib\Irvine32.lib

.data
flag DWORD 0				
cont DWORD 0
media DWORD 0 
msg  BYTE "Entre com um numero: ",0
msg2  BYTE "Media: ",0

.code
principal PROC
	call lenum
inienq:						
	cmp flag,ebx
	je fimenq
	add media,ebx
	call lenum
	add cont,1
	jmp inienq     			
fimenq:
	call medianum
principal ENDP

lenum PROC
	mov edx, OFFSET msg		
	call WriteString		
	call ReadInt
	mov ebx,eax	
	ret
lenum ENDP

medianum PROC
	mov edx,0
	mov eax,media
	div cont
	mov edx, OFFSET msg2
	call WriteString
	call WriteDec
	INVOKE ExitProcess,0
medianum ENDP

END principal
