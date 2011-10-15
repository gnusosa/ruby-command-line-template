## This file is copied to ~/spec when you run 'ruby script/generate rspec'
## from the project root directory.
#
raise "Spec helper loaded TWICE." if defined?(LOADED_SPEC_HELPER)
LOADED_SPEC_HELPER = true
#
## Setup environment to be in the "test" mode
ENV["RAILS_ENV"]   = 'test'
RAILS_ENV          = ENV["RAILS_ENV"]
#
## Require the application configuration that is usually required by main.rb
ENV["QUIET"]       = "1"
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

# Now setup rspec
Rspec.configure do |config|
  ## global before actions go here
end