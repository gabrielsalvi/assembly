		.data
matriz:    	.word    2, 8, -3, 7, 1, -2, 4, 5, 3, 5, 1, -4

str_number:    	.string "Buscar pelo número: "

str_a0:		.string "a0 = "
str_a1:		.string "a1 = "

str_comma:     .string ", "

    		.text
main:
   	la a0, str_number
   	li a7, 4
   	ecall
   
   	li a7, 5
   	ecall
	
	mv s0, a0 # number to search
   	
   	la a0, matriz
   	
   	li a1, 4
   	li a2, 3
   	
  	li s1, -1
  	li s2, -1
  	
  	jal f_numero_na_matriz
  	jal f_imprime
  	
  	j final
  	
f_numero_na_matriz:
	mv s5, a0
	li a4, 0
	
	jal t6, for_each_row
	
	add a0, s1, zero
	add a1, s2, zero
	
	jr ra

# a1 = num of columns
# a2 = num of rows
# a4 = count_rows
# a5 = count_cols
for_each_row:
   	bge a4, a2, end_for_each
   	li a5, 0
   	
   	j search_in_column
   	
search_in_column:
	bge a5, a1, increment_row_count
	
	lw t1, 0(s5)
	beq s0, t1, number_found
	
	addi s5, s5, 4
	
	j increment_col_count

number_found:
	add s1, a4, zero
	add s2, a5, zero
	
	addi s5, s5, 4
	
	j increment_col_count

increment_row_count:
	addi a4, a4, 1
	j for_each_row

increment_col_count:
	addi a5, a5, 1
	j search_in_column   	
   	
end_for_each:
	jr t6
	
f_imprime:
	mv t0, a0
	
	la a0, str_a0
	li a7, 4
	ecall
	
	add a0, t0, zero
	li a7, 1
	ecall
	
	la a0, str_comma
	li a7, 4
	ecall
	
	la a0, str_a1
	li a7, 4
	ecall
	
	add a0, a1, zero
	li a7, 1
	ecall
	
	mv a0, t0
	
	jr ra
	
final:
    nop
