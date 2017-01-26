#Lab 1 - Assembly Programming

##Assignment 1

####Which lines of code had to be changed? Why?

14	addi	$s0,$s0,3	# what happens if the constant is changed?
15
16	li	$t0,0x5d
17	bne	$s0,$t0,loop
