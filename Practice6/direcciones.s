	.data
	.balign 4
string: .asciz "y = %d\n"
y:	.int	0

@ ---------------------------------------
@	Code Section
@ ---------------------------------------
.text
.global main
.extern printf

main:
        push 	{ip, lr}	@ push return address + dummy register
				@ for alignmen
	ldr 	r1, =y
   	mov	r0, #0x13
	str	r0, [r1]
        ldr 	r0, =string
	ldr	r1, =y
	ldr 	r1, [r1]
        bl 	printf

        pop 	{ip, pc}	@ pop return address into pc
