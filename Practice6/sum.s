prompt1: .asciz "Give me the first operand: \n"
prompt2: .asciz "Give me the second operand: \n"
format: .asciz %d"
output: .asciz "%d + %d = %d\n"
x: .int 0
y: .int 0
z: .int 0

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
    add r0, r0, r1
    str r0, [r2]

    ldr r0, =output
    ldr r1, =x
    ldr r2, =y
    ldr r3, =z
    bl printf

    pop {ip, pc}
