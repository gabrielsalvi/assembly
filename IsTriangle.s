	.data
str_num1:   	.asciz	"Entre com o primeiro numero: "       
str_num2:   	.asciz	"Entre com o segundo numero: "
str_num3:   	.asciz	"Entre com o terceiro numero: "

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
	
if_B_greater_than_A:
	bgt s1, s0, B_greater_than_A
	j if_C_greater_than_A
	
B_greater_than_A:
	mv t0, s0
	mv s0, s1
	mv s1, t0
	j if_C_greater_than_A
	
if_C_greater_than_A:
	bgt s2, s0, C_greater_than_A
	j greatest_defined

C_greater_than_A:
	mv t0, s0
	mv s0, s2
	mv s2, t0
	j greatest_defined
	
greatest_defined:
	add t0, s1, s2
	blt s0, t0, is_triangle
	add a0, zero, zero
	j output
	
is_triangle:
	addi a0, zero, 1
	j output
	
output:
	li a7, 1
	add a0, a0, zero
	ecall
