
.data
.balign 4
output: .asciz "y = %x\n"
y: .int 0
b: .int 0xBBBBBBBB
c: .int 0xCCCCCCCC
.text
.extern printf
.extern scanf
.global main


func:
	push {ip,lr} 
	ldr r1 , =y
	ldr r0, =c
    	ldr r0, [r0]
    	str r0, [r1]
    	ldr r0, =output
    	ldr r1, =y
    	ldr r1 , [r1]
    	bl printf
 	pop {ip,pc}

main:

    push {ip, lr}


    ldr r1, =y
    ldr r0 , =0xAAAAAAAA
    str r0, [r1]

    ldr r0, =output
    ldr r1, =y
    ldr r1 , [r1]
    bl printf
    
    ldr r1 , =y
    ldr r0, =b
    ldr r0, [r0]
    str r0, [r1]
    ldr r0, =output
    ldr r1, =y
    ldr r1 , [r1]
    bl printf

   bl func


    pop {ip, pc}
