	.data
str_num1:   	.asciz	"Entre com o primeiro numero: "       
str_num2:   	.asciz	"Entre com o segundo numero: "
str_num3:   	.asciz	"Entre com o terceiro numero: "

str_a0: 	.asciz	"a0 = "

	.text
main: 
	la 	a0, str_num1
	li 	a7, 4
	ecall
	
	li	a7, 5
	ecall
	
	mv	s0, a0
	
	la 	a0, str_num2
	li	a7, 4
	ecall
	
	li	a7, 5
	ecall
	
	mv	s1, a0
	
	la 	a0, str_num3
	li	a7, 4
	ecall
	
	li	a7, 5
	ecall
	
	mv	s2, a0
	
	jal t5, if_A_greater_than_B
	jal t5, print
	
if_A_greater_than_B:
	bgt s0, s1, if_A_greater_than_C

	mv t0, s0
	mv s0, s1
	mv s1, t0
	
	j if_A_greater_than_C
	
if_A_greater_than_C:
	bgt s0, s2, greatest_defined
	
	mv t0, s0
	mv s0, s2
	mv s2, t0
	
	j greatest_defined
	
greatest_defined:
	add t0, s1, s2
	blt s0, t0, is_triangle
	add a0, zero, zero
	
	jr t5
	
is_triangle:
	li a0, 1
	jr t5
	
print:
	mv t0, a0
	
	la a0, str_a0
	li a7, 4
	ecall
	
	li a7, 1
	add a0, t0, zero
	ecall
