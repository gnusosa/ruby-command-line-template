module PidFile
  
  if defined?(PIDFILE)
    @@pidfile =  PIDFILE
  else
    @@pidfile = "#{RAILS_ROOT}/config/pidfile"
  end
  
  def self.store
    File.open(@@pidfile, 'w') {|f| f << Process.pid}
  end
  
  def self.recall
    IO.read(@@pidfile).to_i rescue nil
  end
  
  def self.delete
    FileUtils.rm(@@pidfile) rescue nil
  end
  
  def self.ensure_not_already_running
    unless self.recall.nil?
      DEFAULT_LOGGER.fatal "This application is already running. Exiting now."
      exit
    end
  end
end