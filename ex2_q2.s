.global	count
.text
count:
	subui	$sp, $sp, 8
	sw	$11, 1($sp)
	sw	$12, 2($sp)
	sw	$13, 3($sp)
	sw	$ra, 4($sp)
	lw	$13, 8($sp)
	sw	$13, 0($sp)
	jal	writessd
	lw	$13, 8($sp)
	sw	$13, 7($sp)
	addu	$12, $0, $0
	slt	$13, $13, $12
	bnez	$13, L.2
	addui	$13, $0, 10000
	sw	$13, 6($sp)
	lw	$11, 7($sp)
	sge	$13, $11, $13
	bnez	$13, L.2
	lw	$13, 9($sp)
	sw	$13, 5($sp)
	slt	$13, $13, $12
	bnez	$13, L.2
	lw	$13, 6($sp)
	lw	$12, 5($sp)
	sge	$13, $12, $13
	bnez	$13, L.2
	lw	$13, 8($sp)
	lw	$12, 9($sp)
	sge	$13, $13, $12
	bnez	$13, L.4
	j	L.7
L.6:
	lw	$13, 8($sp)
	sw	$13, 0($sp)
	jal	writessd
	lw	$13, 8($sp)
	addi	$13, $13, 1
	sw	$13, 8($sp)
	jal	delay
L.7:
	lw	$13, 8($sp)
	lw	$12, 9($sp)
	sle	$13, $13, $12
	bnez	$13, L.6
	j	L.5
L.4:
	lw	$13, 8($sp)
	lw	$12, 9($sp)
	sne	$13, $13, $12
	bnez	$13, L.12
	lw	$13, 8($sp)
	sw	$13, 0($sp)
	jal	writessd
	j	L.10
L.11:
	lw	$13, 8($sp)
	sw	$13, 0($sp)
	jal	writessd
	lw	$13, 8($sp)
	subi	$13, $13, 1
	sw	$13, 8($sp)
	jal	delay
L.12:
	lw	$13, 9($sp)
	lw	$12, 8($sp)
	sle	$13, $13, $12
	bnez	$13, L.11
L.10:
L.5:
L.2:
L.1:
	lw	$11, 1($sp)
	lw	$12, 2($sp)
	lw	$13, 3($sp)
	lw	$ra, 4($sp)
	addui	$sp, $sp, 8
	jr	$ra
