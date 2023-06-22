#!/bin/bash

# pedir CPF ao usuário
read -p "Digite o CPF a ser validado (apenas números): " cpf

# validar CPF
soma=0
for (( i=0; i<9; i++ )); do
    soma=$(( soma + ${cpf:i:1}*(10-i) ))
done

resto=$(( soma%11 ))
if [[ $resto -lt 2 ]]; then
    digito1=0
else
    digito1=$(( 11 - $resto ))
fi

soma=0
for (( i=0; i<10; i++ )); do
    soma=$(( soma + ${cpf:i:1}*(11-i) ))
done

resto=$(( soma%11 ))
if [[ $resto -lt 2 ]]; then
    digito2=0
else
    digito2=$(( 11 - $resto ))
fi

# verificar se CPF é válido
if [[ ${cpf:9:1} -eq $digito1 && ${cpf:10:1} -eq $digito2 ]]; then
    echo "CPF $cpf é válido."
else
    echo "CPF $cpf é inválido."
fi
