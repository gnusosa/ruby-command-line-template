require 'rubygems'
require 'bundler'
Bundler.require(:default, RAILS_ENV.to_sym)
require 'active_support/dependencies'

ActiveSupport::Dependencies.autoload_paths.push("#{RAILS_ROOT}/app")