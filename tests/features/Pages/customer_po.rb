class CustomerPage <SitePrism::Page
    set_url '/customers'
    element :name, 'input[name = name]'
    element :phone, 'input[name = phone]'
    element :email, 'input[name = email]'
    element :gender_m, 'input[name=radio-m]'
    element :gender_f, 'input[name=radio-f]'
    element :type, '#type-customer'
    element :notes, 'textarea[name=note]'
    element :auth_info, 'input[type=checkbox]'

    element :add_button, '#dataview-insert-button'
    element :save_button, '#form-submit-button'

    element :search_field, 'input[name=search]'
    element :search_button, 'button[id*=search]'
    element :search_alert_warning, '.alert-warning'

    elements :view, '#dataview-table tbody tr'

    element :modal_body, '.modal-body'
    element :remove_button_yes, '.modal-content button[class*=danger]'

    def save (customer) 

        #a_types = ['Gold', 'Prime', 'Platinum']

        self.add_button.click
        self.name.set customer.name 
        self.phone.set customer.phone
        self.email.set customer.email
        self.gender_m.click if customer.gender.eql?('M')
        self.gender_f.click if customer.gender.eql?('F')
        self.type.find('option', text: customer.type).select_option if customer.type
        #self.type.find('option', text: a_types.sample).select_option
        #self.type.all('option').sample.select_option
        self.notes.set customer.notes 
        self.auth_info.click if customer.auth_info.eql?('true')
        self.save_button.click
        sleep(5)
    end
end