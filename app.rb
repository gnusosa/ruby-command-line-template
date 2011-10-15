## This is a tempalte framework for command-line rails applications
## Evan Tahler | 2011

require "#{File.dirname(File.realpath(__FILE__))}/config/initializers/rails_env"
%w(gems logging models).each do |initializer|
  require "#{RAILS_ROOT}/config/initializers/#{initializer}"
end

## Configuration
PIDFILE = "#{RAILS_ROOT}/config/pidfile"

## Main
def main
  DEFAULT_LOGGER.info "Starting Application"
  ensure_not_already_running
  PidFile.store(PIDFILE)
  ## DO STUFF HERE
  sleep(10)
  PidFile.delete(PIDFILE)
  DEFAULT_LOGGER.info "ALL DONE!"
end

## Pid File methods to ensure this application only runs one-at-a-time
def ensure_not_already_running
  unless PidFile.recall(PIDFILE).nil?
    DEFAULT_LOGGER.fatal "This application is already running. Exiting now."
    exit
  end
end

module PidFile
  def self.store(file_name)
    File.open(file_name, 'w') {|f| f << Process.pid}
  end
  
  def self.recall(file_name)
    IO.read(file_name).to_i rescue nil
  end
  
  def self.delete(file_name)
    FileUtils.rm(file_name) rescue nil
  end
end

## Main Excecution
main