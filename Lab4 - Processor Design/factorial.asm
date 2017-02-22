
addi $a0, $0, 1		# Starting value of n
addi $a1, $a0, 1	# $a1, number of multiplications
#addi $a2, $0, 0		# $a2, i
addi $v0, $0, 1		# result, $v0


loop:
	beq $a1, $0, end
	addi $a1, $a1, -1
	
	addi $v1, $0, 0 	# $v1, result of multiplication
	addi $a3, $0, 0		# $a3, j
	multiply:
		beq $a3, $a1, done
		addi $a3, $a3, 1 	# j++
		add $v1, $v1, $a1
		beq $0, $0, multiply
	
	done:
		addi $v0, $v1, 0
		beq $0, $0, loop

end:
	add  $0,$0,$0	  # NOP