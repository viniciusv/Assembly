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
flag DWORD 0				; Flag de fim double word com sinal
cont DWORD 0
media DWORD 0 
msg  BYTE "Entre com um numero: ",0
msg2  BYTE "Media: ",0

.code
principal PROC
	call lenum
	call medianum
principal ENDP

lenum PROC
	mov edx, OFFSET msg		; edx = primeira posicao da string msg
	call WriteString		; Exibe msg
	call ReadInt	 		; eax = numero do teclado
	mov ebx,eax
	inc cont				; ebx = eax
inienq:						
	cmp flag,ebx
	je fimenq
	add media,ebx
	mov edx, OFFSET msg		; edx = primeira posicao da string msg
	call WriteString		; Exibe msg
	call ReadInt	 		; eax = numero do teclado
	mov ebx,eax				; ebx = eax
	inc cont
	jmp inienq     			; Vai para iníenq
fimenq:
	ret
lenum ENDP

medianum PROC
	mov eax,cont
	div media
	mov edx, OFFSET msg2
	call WriteDec
	INVOKE ExitProcess,0
medianum ENDP

END principal
