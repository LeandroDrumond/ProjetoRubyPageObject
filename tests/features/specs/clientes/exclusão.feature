#language: pt

Funcionalidade: Exclusão de clientes
    Sendo um usuário cadastrado
    Posso acessar o cadastro de clientes
    Para poder remover meus clientes cadastrados

    # O usuário solicita a remoção do cliente
    # em seguida exibe uma mensagem de confirmação
    # o usuário confirmando a exclusão, o cliente é de fato excluido
    # Se o cliente possuir uma ou mais faturas, então o mesmo não poderá ser removido

   Contexto: Usuario logado acessa o cadastro de cliente
    * usuário logado faz login
    * acessa o cadastro de clientes


    @logout @smoke
    Cenário: Remover cliente

        Dado que eu tenho um cliente cadastrado
        Quando solicito a exclusão
            E confirmo a ação de exclusão 
        Então esse cliente não deve ser exibido na busca
      
    @logout
     Cenário: Usuário cancela a solitação 

        Dado que eu tenho um cliente cadastrado
        Quando solicito a exclusão
            E cancelo a ação de exclusão
        Então esse cliente deve ser exibido na busca
     Cenário: Cliente possui fatura

        Dado que o cliente possui fatura(s)
        Quando solicito a exclusão
        Então vejo a seguinte mensagem
        """
        Cliente não pode ser removido, pois possui fatura(s).
        """
    
