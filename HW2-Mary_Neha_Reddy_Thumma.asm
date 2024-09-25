TITLE HW_2_Mary_Neha_Reddy_Thumma.asm
;----------------------------------------------
; Program Name  : Homework 2 - CSCI 2525
; Author        : Mary Neha Reddy Thumma
; Date          : 09/21/2024
; Course        : CSCI 2525 - Assembly Programming
; Description   : This program solves 4 parts as described in Homework 2.
;                 It demonstrates register manipulation, flag settings, 
;                 symbolic constant usage, and arithmetic operations in MASM.
; 
; Instructions  :
; 1. Part 1 calculates the product of integers 2 through 7.
; 2. Part 2 sets the carry flag and overflow flag using registers.
; 3. Part 3 calculates the number of seconds in a day.
; 4. Part 4 performs an arithmetic expression involving signed/unsigned values.
;
; Irvine32 library is used for input/output handling and register/flag display.
;----------------------------------------------

INCLUDE Irvine32.inc
INCLUDELIB Irvine32.lib

.data
;----------------------------------------------
; Data Section
;----------------------------------------------
; Define symbolic constant for Part 3
SECONDS_IN_DAY DWORD 86400 ; 24 hours * 60 minutes * 60 seconds

; Declare variables for Part 4
A DWORD 781379d           ; A = 781379 (signed)
B DWORD 010101101011b     ; B = 010101101011 (binary signed)
C DWORD 0FAC8h            ; C = FAC8 (hexadecimal unsigned)
D DWORD -57d              ; D = -57 (signed)

.code
main PROC
;----------------------------------------------
; Code Section
;----------------------------------------------

;----------------------------------------------
; Part 1: Compute the product of integers 2 * 3 * 4 * 5 * 6 * 7
; Store the result in EAX
;----------------------------------------------
XOR EAX, EAX              ; Clear EAX register
MOV EAX, 2*3*4*5*6*7      ; Compute product and store in EAX
call DumpRegs             ; Display register contents (useful for debugging)
call WaitMsg              ; Pause execution to view the output

;----------------------------------------------
; Part 2a: Set the carry flag (CF) using EBX
; Without using the STC instruction
;----------------------------------------------
XOR EBX, EBX              ; Zero out EBX register
ADD EBX, 0xFFFFFFFF        ; Add -1 to EBX, which will set the carry flag
call DumpRegs             ; Display register contents
call WaitMsg              ; Pause execution to view the output

;----------------------------------------------
; Part 2b: Set the overflow flag (OF) using ECX
; Without using specific overflow instructions
;----------------------------------------------
XOR ECX, ECX              ; Zero out ECX register
ADD ECX, 0x7FFFFFFF       ; Add a large positive value, causing an overflow
call DumpRegs             ; Display register contents
call WaitMsg              ; Pause execution to view the output

;----------------------------------------------
; Part 3: Calculate the number of seconds in a day
; Result is stored in the EDX register
;----------------------------------------------
MOV EDX, SECONDS_IN_DAY   ; Move constant SECONDS_IN_DAY into EDX
call DumpRegs             ; Display register contents
call WaitMsg              ; Pause execution to view the output

;----------------------------------------------
; Part 4: Calculate A = (A - B) + (C - D)
; Using appropriate register sizes and signed/unsigned values
;----------------------------------------------
MOV EAX, A                ; Load A into EAX
SUB EAX, B                ; A = A - B
MOV EBX, C                ; Load C into EBX
SUB EBX, D                ; EBX = C - D
ADD EAX, EBX              ; EAX = (A - B) + (C - D)
MOV A, EAX                ; Store the result back into variable A
call WriteInt             ; Display the result in EAX (final result)
call DumpRegs             ; Display register contents
call WaitMsg              ; Pause execution to view the output

exit
main ENDP
END main
