    #language: pt

    @cad_cliente
    Funcionalidade: Cadastro de Clientes
        Sendo um usuário cadastrado
        Posso acessar o cadastro de Clientes
        Para fins de gerenciamento e tambem atendimento dos meus Clientes

    Contexto: Usuario logado acessa o cadastro de cliente
        * usuário logado faz login
        * acessa o cadastro de clientes
        
        @smoke
        Cenário: Cadastrar novo cliente
            Dado que eu tenha um novo cliente
            Quando faço o cadastro desse cliente
            Então esse cliente deve ser exibido na busca

        @Cad_ClienteDB
        Cenário: Cadastrar novo cliente com dados estáticos
            Nesse exemplo vamos excluir o cliente do banco de dados
            Usando data table + MongoDB

        Dado que eu tenho um novo cliente com os seguintes atributos:
            | name      | Leandro vianna   |
            | phone     | 99 999999999     |
            | email     | itest@iteste.com |
            | gender    | M                |
            | type      | Gold             |
            | notes     | Teste Lorem xxx  |
            | auth_info | true             |
        E esse cliente não deve estar cadastrado no sistema
        Quando faço o cadastro desse cliente
        Então esse cliente deve ser exibido na busca 