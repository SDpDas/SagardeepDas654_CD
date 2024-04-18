c = a + b
.data
a: .word 10      # Variable a initialized to 10
b: .word 20      # Variable b initialized to 20
c: .word 0       # Variable c initialized to 0

.text
main:
    lw $t0, a    # Load value of a into $t0
    lw $t1, b    # Load value of b into $t1
    add $t2, $t0, $t1   # Add values of a and b, store result in $t2
    sw $t2, c    # Store result in c

    # Exit program
    li $v0, 10   # System call code for exit
    syscall