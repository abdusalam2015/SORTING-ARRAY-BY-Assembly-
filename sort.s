.data 
array:.space 16
input1:.asciiz "Enter the array size \n"
input2:.asciiz "Enter the elements \n"
output:.asciiz "Array is Sorted !"
.text
.ent main 
.globl main 
main:
#input size 
li $v0 , 4
la $a0,input1
syscall

li $v0,5
syscall
move $t0,$v0
move $t1,$v0
move $t2,$v0

#iput numbers

li $v0,4
la $a0,input2
syscall
la $s0,array
WHILE:
	beq $t0,$zero,SORT  #after finish input go to sort 
	li $v0,5
	syscall
	sw $v0,0($s0)
	addi $t0,$t0,-1
	addi $s0,$s0,4
j WHILE

SORT:
	li $v0,4
	la $a0,output
	syscall

	la $s0,array
	la $s1,array
	la $a1,array
	move $t0,$t1
	lw $t3,($s0)
WHILE2:	
	beq $t0,$zero,NEXT
	addi $s1,$s1,4
	lw $t4,($s1)
	bgt $t3,$t4,SWAP
	addi $t0,$t0,-1
	j WHILE2
NEXT:
	beq $t2,$zero,PRINTARRAY
	addi $s0,$s0,4
	lw $t3,($s0)
	move $t0,$t2
	addi $t2,$t2,-1
	move $s1,$s0
	j WHILE2
SWAP:
	move $t5,$t3
	sw $t3,0($s1)
	sw $t4,0($s0)	
	move $t3,$t4
	j WHILE2

move  $t2,$a1
PRINTARRAY:#print array from memory 	
	la $t0,array 
	LOOP2:
	beq $t1,$0,END
	lw $a0,($t0)
	li $v0, 1
	syscall
	addi $t0,$t0,4
	addi $t1,$t1,-1
	j LOOP2
END:
	li $v0,10
	syscall
.end main  
