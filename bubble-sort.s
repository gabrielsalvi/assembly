	.data

array:		.word 8, 1, 7, -2, 3, 6, 5

line_break:	.asciz "\n"
space:		.asciz	" "
 
	.text
main:
	la s0, array
	li s1, 7
	
	jal a5, print
	jal a5, bubble_sort
	jal a5, print
	
	j final

bubble_sort:
    	
	# t0 = swapped
	# t1 = count
	
	mv a2, s0

do:
    	addi t0, zero, 0
    	addi t1, zero, 1
for:
    	bge t1, s1, while
    	
    	slli t3, t1, 2
    	add t3, a2, t3
    	
	lw  a0, -4(t3)
    	lw  a1, 0(t3)
    	
    	bgt a0, a1, swap
    
    	j increment_count

increment_count:
    	addi t1, t1, 1
    	j for
    	
while:
    	bne t0, zero, do
    	jr a5

swap:
	addi t0, zero, 1
    	sw  a0, 0(t3)
    	sw  a1, -4(t3)
    	j increment_count
    	
print:
    	mv t0, s0
    	
    	li t2, 0
    	jal a6, for_print
    	
    	la a0, line_break
	li a7, 4
	ecall
    	
    	jr a5
    	
for_print:
	blt t2, s1, print_array_value
	jr a6
    	
print_array_value:

	addi t0, t0, 4
	lw t3, -4(t0)
    	
    	li a7, 1
    	add a0, t3, zero
    	ecall
    	
    	la a0, space
	li a7, 4
	ecall
    	
    	addi t2, t2, 1
    	j for_print
	    	    	    	
final:
	nop