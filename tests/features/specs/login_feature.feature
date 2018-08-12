#language: pt

Funcionalidade: Login
    Sendo o usuário do invoices
    Quero acessar o sistema 
    Para que eu possa cadastrar meus clientes e tambem lançar faturas

    Contexto: Acessa a página login
        * acessa página login

    @smoke @logout
    Cenário: Administrador faz login

       # Dado que estou na página de login
        #Quando preencho o campo email com "Kato.danzo@qaninja.com.br"
        #E preencho o campo senha com "secret"
        #E clico no botão Entrar
        #Então vejo a página home logado

      Dado que eu tenho um usuário Administrador com os atributos: 
       | email | kato.danzo@qaninja.com.br |
       | senha | secret                    |
      Quando faço login
      Então vejo o Dashboard com a mensagem "Dashboard"

# Cenário abaixo se chama: Cenário Expressivo

      @tentativa_login
      Cenário: Tentativa de login 

      Dado que eu tenho uma lista com os seguinges usuários:
        | email                            | password | message                   |
        | Kato.danzo@qaninja.com.br        |  123456  |  Senha inválida.          |
        | user.naoexiste@qaninja.com.br    |  123456  |  Usuário não cadastrado.  |
        | kato.danzo$qaninja.co.br         |  secret  |  Informe um email válido. |


      Quando faço a tentativa de login 
      Então vejo uma mensagem de erro na página login

