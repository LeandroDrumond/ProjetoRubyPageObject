#encoding:utf-8

Dado(/^acessa página login$/) do
 # @login = LoginPage.new
  #@dash = DashPage.new
  #@nav = NavBar.new
  @login.load
end

Dado(/^que eu tenho um usuário Administrador com os atributos:$/) do |table|
    @email =  table.rows_hash['email']
    @password = table.rows_hash['senha']
  end
 
  Quando(/^faço login$/) do
      #@login.email.set @email
      #@login.password.set @password
      #@login.sign_in.click
      @login.fazer_login(@email, @password)

 end
  
  Então(/^vejo o Dashboard com a mensagem "([^"]*)"$/) do |message|
    expect(@dash.title.text).to eql message
    expect(@nav.user_menu.text).to eql @email

 end

Dado(/^que eu tenho uma lista com os seguinges usuários:$/) do |table|
 @users = table.hashes
end

Quando(/^faço a tentativa de login$/) do
    @messages_erro = Array.new
    @messages_spec = Array.new
    

  @users.each do |user|
    
    #@login.email.set ''
    #@login.password.set ''
    @login.limpar_campos
    #@login.email.set @email
    #@login.password.set @password
    #@login.sign_in.click
    @login.fazer_login(user['email'], user ['password'])

    @messages_erro.push(@login.msg_erros.text)
    @messages_spec.push(user['message'])
    sleep(2)
  end
end

Então(/^vejo uma mensagem de erro na página login$/) do
   expect(@messages_erro).to eql @messages_spec
end 