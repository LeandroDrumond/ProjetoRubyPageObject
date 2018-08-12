#language:pt

Funcionalidade: Saque no ATM
Sendo um cliente do Ninja Bank
Posso acessar minha conta corrente no ATM
Para eu possa fazer um saque

#DADO é a pré-condição
#QUANDO é a ação
#ENTÃO é o resultado esperado
#E é o complemento do resultado esperado


Cenário: Saque com sucesso

Dado que o saldo da minha conta corrente é de R$ 1000
Quando eu faço  um saque no valor de R$ 200
Então o ATM deve dispensar o valor do saque
    E o saldo final da minha conta deve ser de R$ 800

Cenário: Saldo insuficiente

Dado que o saldo da minha conta corrente é de R$ 1000
Quando eu faço um saque no valor de R$ 1100
Então devo ver a mensagem "Saldo insuficiente."

Cenário: Saldo insuficiente quando ocorre um débito automático

Dado que o saldo da minha conta corrente é de R$ 1000
    Mas ocorreu um débito automático no valor de R$ 800
Quando eu faço um saque no valor de R$ 500
Então devo ver a mensagem "Saldo insuficiente."

