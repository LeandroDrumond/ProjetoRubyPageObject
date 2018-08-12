class LoginPage <SitePrism::Page
    set_url '/login'
    element :email, '#email'
    element :password, 'input[placeholder$=senha]'
    element :sign_in, '.login-button'
    element :msg_erros, '#login-errors' 

    def limpar_campos 

        self.email.set ''
        self.password.set ''
    end

    def fazer_login (user, pwd)

        self.email.set user
        self.password.set pwd
        self.sign_in.click

    end

end