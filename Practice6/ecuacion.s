
.data
.balign 4
prompt1: .asciz "Give me x: \n"
format: .asciz "%d"
output: .asciz "6(%d)^2 + 9(%d) + 2 = %d\n"
x: .int 0
z: .int 0
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

    ldr r0, =x
    ldr r1, =z
    ldr r0, [r0]
@do equation
    mul r4, r0, r0
    mov r6, #6
    mul r5, r4, r6
    mov r6, #9
    mul r4, r0, r6
    add r0 , r4, r5
    add r0 , r0 ,#2
    str r0, [r1]

    ldr r0, =output
    ldr r1, =x
    ldr r1, [r1]
    ldr r2, =x
    ldr r2, [r2]
    ldr r3, =z
    ldr r3, [r3]
    bl printf

    pop {ip, pc}
