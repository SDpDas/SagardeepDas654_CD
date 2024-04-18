.data
prompt: .asciiz "Enter a number: "
prime_msg: .asciiz "The number is prime."
not_prime_msg: .asciiz "The number is not prime."

.text
.globl main
main:
    # Print prompt
    li $v0, 4
    la $a0, prompt
    syscall

    # Read input
    li $v0, 5
    syscall
    move $t0, $v0

    # Check if number is prime
    li $t1, 2
    beq $t0, 1, not_prime
    beq $t0, 2, prime

loop:
    div $t0, $t1
    mfhi $t2
    beq $t2, 0, not_prime
    addi $t1, $t1, 1
    blt $t1, $t0, loop

prime:
    li $v0, 4
    la $a0, prime_msg
    syscall
    j exit

not_prime:
    li $v0, 4
    la $a0, not_prime_msg
    syscall

exit:
    li $v0, 10
    syscall