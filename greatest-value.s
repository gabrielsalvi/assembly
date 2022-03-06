    .data
    .text
main:
    addi s0, zero, 7
    addi s1, zero, 13
    addi s2, zero, 2
    
    add a0, zero, s0
    
    jal t0, if_s1_greater_than_a0
    j final
    
if_s1_greater_than_a0:
    ble s1, a0, if_s2_greater_than_a0
    
    add a0, zero, s1
    j if_s2_greater_than_a0
    
if_s2_greater_than_a0:
    ble s2, a0, final
    
    add a0, zero, s2
    jr t0   
    
final:
    li a7, 1
    add a0, a0, zero
    ecall
