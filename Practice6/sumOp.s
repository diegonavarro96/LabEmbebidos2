.data
.balign 4
prompt1: .asciz "Give me the first operand: \n"
prompt2: .asciz "Give me the second operand: \n"
prompt3: .asciz "Give me the operand(+,-,*,/):  \n"
format: .asciz "%d"
formatOp: .asciz "%s"
output: .asciz "%d %s %d ="
output2: .asciz " %d \n"
x: .int 0
y: .int 0
z: .int 0
op: .asciz "a"
.text
.extern printf
.extern scanf
.global main
main:

    push {ip, lr}
    ldr r0, =prompt1
    bl printf

    ldr r0, =format
    ldr r1, =x
    bl scanf

    ldr r0, =prompt3
    bl printf

    ldr r0, =formatOp
    ldr r1, =op
    bl scanf

    ldr r0, =prompt2
    bl printf

    ldr r0, =format
    ldr r1, =y
    bl scanf



    ldr r0, =x
    ldr r1, =y
    ldr r2, =z
    ldr r0, [r0]
    ldr r1, [r1]
    ldr r3, =op
    ldrb r3, [r3]
    cmp r3, #0x2b
    beq suma
    cmp r3, #0x2d
    beq resta
    cmp r3 , #0x2a
    beq mult
    cmp r3, #0x2f
    beq div
    ldr r0, #0x00
    b done
@metodo suma
suma:
    add r0, r0, r1
    b done
@metodo resta
resta:
    sub r0, r0, r1
    b done
@multiplication
mult:
    mul r5, r0 ,r1
    ldr r0, r5
    b done
@division
div:
@   sdiv r0, r0, r1
   b done
done:
    str r0, [r2]

    ldr r0, =output
    ldr r1, =x
    ldr r1, [r1]
    ldr r2, =op
    ldr r3, =y
    ldr r3, [r3]
    bl printf


    ldr r0, =output2
    ldr r1, =z
    ldr r1, [r1]
    bl printf

    pop {ip, pc}
