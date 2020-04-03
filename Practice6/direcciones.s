
	.data
	.balign 4	
string: .asciz "\na + b = %d\n"
b:	.int	0xBBBBBBB
c:	.int 0	@ will contain a+b 

@ ---------------------------------------
@	Code Section
@ ---------------------------------------
@r1 = 0xAAAAAAAA	
.text
.global main
.extern printf

main:	
        push 	{ip, lr}	@ push return address + dummy register
				@ for alignment

        ldr	r1, =0xAAAAAAAA	
	ldr	r2, =b
	ldr	r2, [r2]
	add	r1, r1, r2
	ldr	r2, =c
	str	r1, [r2]
	
	
        ldr 	r0, =string 	@ get address of string into r0
	ldr	r1, [r2]	@ pass c=a+b into r1
        bl 	printf		@ print string and r1 as param

        pop 	{ip, pc}	@ pop return address into pc
