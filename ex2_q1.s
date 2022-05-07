.text
.global print

print:
    subui $sp, $sp, 5
    sw $2, 0($sp)
    sw $3, 1($sp)
    sw $4, 2($sp)
    sw $5, 3($sp)
    sw $ra, 4($sp)

    lw $3, 5($sp)
    addi $5, $0, 5
    lw $2, digits($0)
    subui $2, $2, 1
    sw $2, digits($0)
    addui $2, $2, 1
    
pushloop:
    beqz $5, pop
    remi $4, $3, 10
    addi $4, $4, 48
    subui $2, $2, 1
    sw $4, 0($2)
    divi $3, $3, 10
    subi $5, $5, 1
    j pushloop

pop:
    addi $5, $0, 5

poploop:
    beqz $5, finish
    lw $3, 0($2)
    addui $2, $2, 1
    sw $3, 0($sp)
    jal putc
    subi $5, $5, 1
    j poploop

finish:
    lw $ra, 4($sp)
    lw $5, 3($sp)
    lw $4, 2($sp)
    lw $3, 1($sp)
    lw $2, 0($sp)
    addui $sp, $sp, 5
    jr $ra

.data
digits:
    .word stack

.bss
.space 5
stack: