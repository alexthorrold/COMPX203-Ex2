.text
.global main

main:
    subui $sp, $sp, 5
    sw $2, 2($sp)
    sw $3, 3($sp)
    sw $ra, 4($sp)

    jal readswitches
    andi $2, $1, 0xFF
    srli $3, $1, 8
    andi $3, $3, 0xFF
    sw $2, 0($sp)
    sw $3, 1($sp)
    jal count

    lw $ra, 4($sp)
    lw $3, 3($sp)
    lw $2, 2($sp)
    addui $sp, $sp, 5
    jr $ra