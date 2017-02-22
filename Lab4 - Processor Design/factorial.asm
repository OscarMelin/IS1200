
addi $v0, $0, 0		# Return register
addi $a0, $0, 1		# n
addi $a1, $0, 1		# i
addi $v1, $0, 0		# return for multiply
addi $a2, $v1, 1


loop:
	beq  $a1, $a0, end
	add  $0, $0, $0	# NOP

	add $a2, $a2, $v1
	addi $a3, $a1, 1
	addi $v1, $0, 0
	# Multiplies $a2 with $a3 and returns in $v1
	multiply:
		beq  $a2, $0, done
		add  $0, $0, $0	# NOP
		
		add	 $v1, $v1, $a3
		addi $a2, $a2, -1

		beq  $0, $0, multiply
		add  $0, $0, $0	# NOP
	
	done:
		addi $a1, $a1, 1	# i++
		
		beq  $0, $0, loop
		add  $0, $0, $0		# NOP

end:
	add  $v0, $v0, $v1	# Increment global return
	beq  $0,$0,end