  # timetemplate.asm
  # Written 2016 by Oscar Melin
  # Copyright abandonded - this file is in the public domain.

.macro	PUSH (%reg)
	addi	$sp,$sp,-4
	sw	%reg,0($sp)
.end_macro

.macro	POP (%reg)
	lw	%reg,0($sp)
	addi	$sp,$sp,4
.end_macro

	.data
	.align 2
mytime:	.word 0x5957
timstr:	.ascii "text more text lots of text\0"
	.text
main:
	# print timstr
	la	$a0,timstr
	li	$v0,4
	syscall
	nop
	# wait a little
	li	$a0,1000
	jal	delay
	nop
	# call tick
	la	$a0,mytime
	jal	tick
	nop
	# call your function time2string
	la	$a0,timstr
	la	$t0,mytime
	lw	$a1,0($t0)
	jal	time2string
	nop
	# print a newline
	li	$a0,10
	li	$v0,11
	syscall
	nop
	# go back and do it all again
	j	main
	nop
# tick: update time pointed to by $a0
tick:	lw	$t0,0($a0)	# get time
	addiu	$t0,$t0,1	# increase
	andi	$t1,$t0,0xf	# check lowest digit
	sltiu	$t2,$t1,0xa	# if digit < a, okay
	bnez	$t2,tiend
	nop
	addiu	$t0,$t0,0x6	# adjust lowest digit
	andi	$t1,$t0,0xf0	# check next digit
	sltiu	$t2,$t1,0x60	# if digit < 6, okay
	bnez	$t2,tiend
	nop
	addiu	$t0,$t0,0xa0	# adjust digit
	andi	$t1,$t0,0xf00	# check minute digit
	sltiu	$t2,$t1,0xa00	# if digit < a, okay
	bnez	$t2,tiend
	nop
	addiu	$t0,$t0,0x600	# adjust digit
	andi	$t1,$t0,0xf000	# check last digit
	sltiu	$t2,$t1,0x6000	# if digit < 6, okay
	bnez	$t2,tiend
	nop
	addiu	$t0,$t0,0xa000	# adjust last digit
tiend:	sw	$t0,0($a0)	# save updated result
	jr	$ra		# return
	nop

  # you can write your code for subroutine "hexasc" below this line
  #
hexasc:
	andi	$t0, $a0, 0xf

	slti	$t1,$a0,10		# checks if $t0 < 9
	bne		$t1,$zero,low	# if $t0 <= t0, goes to low
	
	slti	$t1,$a0,16		# checks if $t0 < 15
	bne		$t1,$zero,high	# if $t0 <= t0, goes to high

	low:
		addi	$v0,$t0, 0x30
		jr $ra
		nop
	high:
		addi	$v0,$t0, 0x37
		jr $ra
		nop
		
delay:

	# constant
	li $t1, 3
	# ms
	move $t2, $a0

	
	while:
	
		# ms > 0;
		ble $t2, 0, exit
		# ms = ms - 1;
		sub $t2, $t2, 1
		# int i = 0;
		li $t0, 0
	
		for:
		
			# i < $t1
			bge $t0, $t1, while
			nop
			addi $t0, $t0, 1
			
			j for
			nop
						
		j while
		nop
	
	exit:

		jr $ra
		nop

time2string:
	PUSH $ra
	PUSH $s0
	PUSH $s1

	move $s0, $a0 # Address where well store printable time
	move $s1, $a1 # Address of mytime
		
	#ADD CHECK FOR RESET?
	
	andi $t0, $s1, 0xf000 # Get first digit
	srl $a0, $t0, 0x0c # Shift right by 12
	jal hexasc
	nop
	move $t1, $v0
	sb $t1, 0($s0)
	
	andi $t0, $s1, 0xf00 # Get second digit
	srl $a0, $t0, 0x8 # Shift right by 8
	jal hexasc
	nop
	move $t1, $v0
	sb $t1, 1($s0)
	
	li $t1, 0x3a # Load :
	sb $t1, 2($s0)
	
	andi $t0, $s1, 0xf0 # Get third digit
	srl $a0, $t0, 0x4 # Shift right by 4
	jal hexasc
	nop
	move $t1, $v0
	sb $t1, 3($s0)
	
	andi $a0, $s1, 0xf # Get last digit, no shift needed
	jal hexasc
	nop
	move $t1, $v0
	sb $t1, 4($s0)
	
	li $t1, 0x0
	sb $t1, 5($s0) # Store string terminator

	POP $s1
	POP $s0
	POP $ra
	jr $ra
	nop