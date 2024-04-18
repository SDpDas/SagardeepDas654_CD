    .data
result: .asciiz "\nThe factorial of 5 is: "

    .text
    .globl main
main:
    li $t0, 5 # this is the number we're calculating the factorial of
    li $t1, 1 # this will hold the result of the factorial calculation

factorial_loop:
    beqz $t0, end_factorial_loop
    mul $t1, $t1, $t0
    sub $t0, $t0, 1
    j factorial_loop

end_factorial_loop:
    li $v0, 4
    la $a0, result
    syscall

    move $a0, $t1
    li $v0, 1
    syscall

    li $v0, 10
    syscall
