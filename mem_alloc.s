#Larry Alves
#Guilherme Roelli Bernardini
#Taynara Araújo de Assis
#Vitor Yuzo Takei

.data
    newline: .asciiz "\n"  # Definindo o caractere de nova linha

.text

.globl main
main:

    addi $a0,$zero,400      # Servico sbrk
    addi $v0,$zero,9
    syscall
    add $t0,$zero,$v0       # Jogando o endereco do vetor para t0

    addi $s1,$zero,0        # Inicializando i=0
    addi $s2,$zero,2        # Inicializando 2 * (i) ...
    addi $s3,$zero,0        # Inicializando contador = 0
    addi $t2,$zero,0        # Inicializando contador de impressao = 0
    addi $s4,$zero,100      # Inicializando valor referencia = 100

    while:

        beq $s3,$s4,impressao   # Se os registradores tiverem valores iguais, imprime
        mul $t1,$s1,$s2         # 2 * i
        add $t1,$t1,$s1         # resultado + i

        addi $t0,$t0,-4         # reservando novo espaco no vetor
        sw $t1,0($t0)           # gurandando o valor calculado no vetor
        addi $s3,$s3,1          # incrementando contador
        addi $s1,$s1,1          # incrementando i

    j while

    impressao:

        beq $t2,$s4,exit    # Se os registradores tiverem valores iguais, chegamos ao fim

        lw $t1,0($t0)       # Resgatando o valor do vetor e jogando no registrador

        add $a0,$zero,$t1   # Imprimindo valor
        addi $v0,$zero,1
        syscall


        addi $v0,$zero,4    # Imprimir nova linha
        la $a0,newline    
        syscall            

        addi $t2,$t2,1      # incrementando contador
        addi $t0,$t0,4      # atualizando valor de poscao do vetor

        j impressao 

    exit:

        addi $v0,$zero,10
        syscall


addi $v0,$zero,10
syscall 