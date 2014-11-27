TITLE Enquanto 1

.386
.model flat,stdcall
include c:\masm32\include\kernel32.inc
include c:\masm32\include\Irvine32.inc
includelib c:\masm32\lib\kernel32.lib
includelib c:\masm32\lib\Irvine32.lib

.data
flag SDWORD 0				; Flag de fim double word com sinal
n1 SDWORD 0
msg  BYTE "Entre com um numero: ",0
msg2 BYTE "maior: ",0

.code
principal PROC
	call lenum
	INVOKE ExitProcess,0
principal ENDP

lenum PROC
	mov edx, OFFSET msg		
	call WriteString		
	call ReadInt	 		
	mov ebx,eax				
inienq:						
	call maiornum
	cmp flag,ebx
	je fimenq	 			
	mov edx, OFFSET msg		
	call WriteString		
	call ReadInt	 		
	mov ebx,eax				
	jmp inienq     			
fimenq:
	mov edx,OFFSET msg2
	call WriteString
	call WriteDec
	ret
lenum ENDP

maiornum PROC
	cmp ebx,n1
	jg entao
	jmp fimse
entao:
	mov n1,ebx
fimse:
	ret
maiornum ENDP

END principal
