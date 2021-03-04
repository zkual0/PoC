require './spec/spec_helper'
Dir["./spec/helpers/*helper_spec.rb"].each {|file| require file }  # including all the helpers by default
Dir["./spec/features/pages/*_page.rb"].each {|file| require file } # including all the pages by default
Dir["./spec/features/pages/api/*_page.rb"].each {|file| require file } # including all the api pages by default

require 'json'