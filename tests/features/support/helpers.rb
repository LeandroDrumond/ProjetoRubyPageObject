require 'faker'

module Helpers
    def get_faker_customer
        @name = "#{Faker::Name.first_name} #{Faker::Name.last_name}"
        
        @new_customer = OpenStruct.new(
            :name => @name, 
            :email => Faker::Internet.free_email(@name),
            :phone => Faker::PhoneNumber.cell_phone,
            :notes => Faker::Lorem.paragraph,
            #:auth_info => true
            :auth_info => 'true'
        )
    end
 end