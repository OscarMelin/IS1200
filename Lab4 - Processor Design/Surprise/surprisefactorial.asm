

addi $a0, $0, 1		# n
addi $v0, $0, 1		# result
addi $a1, $0, 1		# i = 1

beq $a0, $0, basecase	# n == 0
add  $0, $0, $0		# NOP

loop:
	beq $a1, $a0, done		# i == n
	mul $v0, $v0, $a1		# multiply with i
	addi $a1, $a1, 1		# i++
	beq $0, $0, loop		# loop
	add  $0,$0,$0	  # NOP

basecase:
	addi $v0, $0, 1

done:
	add  $0,$0,$0	  # NOP