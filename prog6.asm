TITLE Enquanto 1

.386
.model flat,stdcall
include c:\masm32\include\kernel32.inc
include c:\masm32\include\Irvine32.inc
includelib c:\masm32\lib\kernel32.lib
includelib c:\masm32\lib\Irvine32.lib

.data
dia DWORD ?
mes DWORD ?
ano DWORD ?
msg1 BYTE "Entre com o dia: ",0
msg2 BYTE "Entre com o mes: ",0
msg3 BYTE "Entre com o ano: ",0
msg4 BYTE "dia Invalido!",0
msg5 BYTE "mes Invalido!",0

.code
principal PROC
	call leData
	mov eax,dia
	call comparaDia
	call comparaMes
	INVOKE ExitProcess,0
principal ENDP

leData PROC
	mov edx,OFFSET msg1
	call WriteString
	call ReadInt
	mov dia,eax
	mov edx,OFFSET msg2
	call WriteString
	call ReadInt
	mov mes,eax
	mov edx,OFFSET msg3
	call WriteString
	call ReadInt
	mov ano,eax
	ret
leData ENDP

comparaDia PROC
	cmp eax,1
	jb erro
	cmp eax,31
	ja erro 
	jmp fim
erro:
	mov edx, OFFSET msg4
	call WriteString
fim:
	ret
comparaDia ENDP

comparaMes PROC
	cmp eax,1
	jb erro
	cmp eax,12
	ja erro 
	jmp fim
erro:
	mov edx, OFFSET msg5
	call WriteString
fim:
	ret
comparaMes ENDP

END principal
