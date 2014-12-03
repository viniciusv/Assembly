TITLE Enquanto 7
;Faça um programa que leia do teclado um array de 10 posições, depois leia um número também do teclado e verifique 

;se o número está ou não no array. Implemente três procedimentos: um para a leitura do array, um segundo para a 

;leitura do número a ser procurado e um terceiro para mostrar se o número encontra-se no array.


.386
.model flat,stdcall
include c:\masm32\include\kernel32.inc
include c:\masm32\include\Irvine32.inc
includelib c:\masm32\lib\kernel32.lib
includelib c:\masm32\lib\Irvine32.lib

.data
msg BYTE "Entre com um numero: ",0
msg2 BYTE "Numero Achado!",0
msg3 BYTE "Numero nao achado!",0
msg4 BYTE "Entre com um numero a ser acahado: ",0
array DWORD 10 DUP(0)
n DWORD ?

.code
principal PROC
	mov edi,OFFSET array
	mov ecx, LENGTHOF array
	call learray
	call lenum
	call pesquisa
principal ENDP

learray PROC
	push edi
	push ecx
arrayle:
	mov edx,OFFSET msg
	call WriteString
	call ReadInt
	mov [edi],eax
	add edi, TYPE array
	loop arrayle
	pop ecx
	pop edi	
	ret	 
learray ENDP

lenum PROC
	mov edx, OFFSET msg4	
	call WriteString	
	call ReadInt	 		
	mov n,eax
	ret				
lenum ENDP

pesquisa PROC
	mov eax,n
pesquisan:
	cmp eax,[edi]
	je entao
	add edi, TYPE array
	loop pesquisan
	jmp senao
entao:
	mov edx, OFFSET msg2
	call WriteString
	jmp fimse
senao:
	mov edx, OFFSET msg3
	call WriteString
fimse:
	INVOKE ExitProcess,0

pesquisa ENDP

END principal

