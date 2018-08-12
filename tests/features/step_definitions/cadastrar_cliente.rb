#encoding:utf-8

Dado(/^usuário logado faz login$/) do
    @login.load
    @login.fazer_login('Kato.danzo@qaninja.com.br', 'secret')
    #@login.fazer_login('admin-qa@ninvoices.com', 'secret')
    @dash.wait_for_title
  end
  
  Dado(/^acessa o cadastro de clientes$/) do
    @customer.load
  end

Dado(/^que eu tenha um novo cliente$/) do 
    #@new_customer = table.rows_hash
    @new_customer = get_faker_customer
  end
  
  Dado(/^que eu tenho um novo cliente com os seguintes atributos:$/) do |table|
    @new_customer = OpenStruct.new(table.rows_hash)
  end
  
  Dado(/^esse cliente não deve estar cadastrado no sistema$/) do
    Mongo::Logger.logger.level = ::Logger::FATAL
    
    client = Mongo::Client.new($heroku_uri)
     #client[:customers].delete_one({:email => @new_customer.email})
    client.close

  end

  Quando(/^faço o cadastro desse cliente$/) do
    @customer.save(@new_customer)
  end
  
  Então(/^esse cliente deve ser exibido na busca$/) do
    @customer.search_field.set @new_customer.email
    @customer.search_button.click
    expect(@customer.view.size).to eql 1
    expect(@customer.view.first.text).to have_content @new_customer.name
    expect(@customer.view.first.text).to have_content @new_customer.email
    expect(@customer.view.first.text).to have_content @new_customer.phone
  end


  ## Delete

  Dado(/^que eu tenho um cliente cadastrado$/) do
    @new_customer = get_faker_customer
    @customer.save(@new_customer)
      #steps %{
       #Dado que eu tenha um novo cliente
        #Quando faço o cadastro desse cliente
      #}

  end
  
  Quando(/^solicito a exclusão$/) do
    @customer.wait_for_view
    @customer.view.each do |line|
      if (line.text.include?(@new_customer.email))
        line.find('span[class*=trash]').click
      end
    end
  end
  
  Quando(/^confirmo a ação de exclusão$/) do
    @customer.remove_button_yes.click
    
  end
  
  Quando(/^cancelo a ação de exclusão$/) do
    pending # Write code here that turns the phrase above into concrete actions
  end 
 
  Então(/^esse cliente não deve ser exibido na busca$/) do
    @customer.search_field.set @new_customer.email
    @customer.search_button.click
    expect(
      @customer.search_alert_warning.text
    ).to eql "\"#{@new_customer.email}\" não encontrado."
    
  end

  Dado(/^que o cliente possui fatura\(s\)$/) do
    @new_customer = OpenStruct.new({email: 'schumm.armand@yahoo.com'})
  end
  
 # Quando(/^solicito a exclusão desse cliente$/) do
   # pending # Write code here that turns the phrase above into concrete actions
  #end
  
  Então(/^vejo a seguinte mensagem$/) do |message|
    expect(
      @customer.modal_body.text
    ).to have_content message
  end