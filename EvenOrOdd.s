	.data
input: 		.asciz	"Type a number: "
even_output:	.asciz	" is even!"
odd_output:	.asciz	" is odd!"

	.text
main: 
	la 	a0, input
	li 	a7, 4
	ecall
	li	a7, 5
	ecall
	mv	s0, a0
	
	addi t0, zero, 1
    	and s1, s0, t0	   # check whether the number is even or odd
	
	li a7, 1
	add a0, zero, s0
	ecall
	
if_number_is_even:
	beq s1, zero, the_number_is_even
	j the_number_is_odd	

the_number_is_even:
	la a0, even_output
	li a7, 4
	ecall
	j final
	
the_number_is_odd:
	la a0, odd_output
	li a7, 4
	ecall
	j final
	
final:
	nop