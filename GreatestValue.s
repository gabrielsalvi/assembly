    .data
    .text
main:
    addi s0, zero, 7
    addi s1, zero, 13
    addi s2, zero, 2
    
    add a0, zero, s0
    
if_s1_greater_than_a0:
    bgt s1, a0, s1_greater_than_a0
    j if_s2_greater_than_a0
    
if_s2_greater_than_a0:
    bgt s2, a0, s2_greater_than_a0
    j final    

s1_greater_than_a0:
    add a0, zero, s1
    j if_s2_greater_than_a0
        
s2_greater_than_a0:
    add a0, zero, s2
    j final
    
final:
    li a7, 1
    add a0, a0, zero
    ecall
