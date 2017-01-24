.data

names: .space 16

Ryan: .asciiz "Ryan\n"
Tami: .asciiz "Tami\n"
Blake: .asciiz "Blake\n"
John: .asciiz "John\n"

.text
main:

la $t0, names

la $t1, Ryan
sw $t1, 0($t0)

la $t1, Tami
sw $t1, 4($t0)

la $t1, Blake
sw $t1, 8($t0)

la $t1, John
sw $t1, 12($t0)

#Printing i:th element to the console

li $v0, 4	#Prepare to print a string to the user's console
lw $a0, 4($t0)
syscall