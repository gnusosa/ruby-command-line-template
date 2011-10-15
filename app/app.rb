## This is a tempalte framework for command-line rails applications
## Evan Tahler | 2011

require "#{File.dirname(File.realpath(__FILE__))}/../config/initializers/rails_env"
%w(gems logging models).each do |initializer|
  require "#{RAILS_ROOT}/config/initializers/#{initializer}"
end

## Main
def main
  DEFAULT_LOGGER.info "Starting Application"
  PidFile.ensure_not_already_running
  PidFile.store
  ## DO STUFF HERE
  sleep(10)
  PidFile.delete
  DEFAULT_LOGGER.info "ALL DONE!"
end

## Main Excecution
main