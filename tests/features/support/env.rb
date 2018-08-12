require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'rspec'
require 'site_prism'
require 'faker'
require 'ostruct'
require 'mongo'

require_relative 'helpers'
World(Helpers)

$heroku_uri = 'mongodb://heroku_k3nkvbfs:um7pv4b4ievldegk2vb6f08j6c@ds163232.mlab.com:63232/heroku_k3nkvbfs'

Faker::Config.locale = 'pt-BR'

Capybara.configure do |config|
    config.default_driver = :selenium
    config.app_host = 'https://ninjainvoices.herokuapp.com'
    #config.app_host = 'https://ninvoices-qa.herokuapp.com'
    
end

#Capybara.register_driver :selenium do |app|
    #Capybara::Selenium::Driver.new(app, browser: :chrome)
  #end

Capybara.default_max_wait_time = 5