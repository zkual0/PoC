require 'rubygems'
require 'rspec'
require 'rspec/core/rake_task'

namespace :ns do

  desc 'Run all specs for landing page'
  RSpec::Core::RakeTask.new :landing_page do |t|
    t.pattern = 'spec/**/landing_page_spec.rb'
    t.verbose = false
  end
end

#desc 'Run all specs for demo'
RSpec::Core::RakeTask.new :landing_page do |t|
  t.pattern = 'spec/**/landing_page_spec.rb'
  t.verbose = false
end


# ./configure
# make
# make install
# make clean
# make uninstall