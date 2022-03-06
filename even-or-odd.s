	.data
str_input: 	.asciz	"Type a number: "
str_even:	.asciz	" is even!"
str_odd:	.asciz	" is odd!"

	.text
main: 
	la a0, str_input
	li a7, 4
	ecall
	
	li a7, 5
	ecall
	
	mv s0, a0
	
	addi t0, zero, 1
    	and s1, s0, t0	   # check whether the number is even or odd
	
	jal t5, if_number_is_even
	j print
	
if_number_is_even:
	beq s1, zero, the_number_is_even
	j the_number_is_odd	

the_number_is_even:
	la a0, str_even
	jr t5
	
the_number_is_odd:
	la a0, str_odd
	jr t5
	
print:
	mv t0, a0
	
	li a7, 1
	mv a0, s0
	ecall
	
	mv a0, t0
	
	li a7, 4
	ecall

	nop
