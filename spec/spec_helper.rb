# - - - - - - - - - - - - - - -
# CORE DEPENDENCIES
# - - - - - - - - - - - - - - -
require 'rspec'
require 'rspec/expectations'
require 'capybara'
require 'capybara/dsl'
require 'capybara/rspec'
require 'pry'
require 'factory_bot'   #require 'factory_girl'

# local files
require './lib/driver_settings'

# - - - - - - - - - - - - - - -
# CAPYBARA's MAGIC
# - - - - - - - - - - - - - - -
Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.run_server             = false
Capybara.default_driver         = :chrome
Capybara.default_max_wait_time  = 7
Capybara.default_selector       = :css

# - - - - - - - - - - - - - - -
# RSPEC SETTINGS
# - - - - - - - - - - - - - - -
RSpec.configure do |config|
  #  config.include Capybara::DSL  # excluded to avoid having unnecessary methods in global scope
  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    FactoryBot.definition_file_paths = [File.expand_path(File.join(Dir.pwd, 'spec/data/factories' ))]
    FactoryBot.find_definitions
  end

  config.before :all do
  end
  config.after :all do
  end

  config.filter_run debug: true
  config.run_all_when_everything_filtered = true


  config.color = true
  config.tty = true
  config.formatter = :documentation
end