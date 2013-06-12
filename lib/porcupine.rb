class Porcupine
end

require 'net/smtp'
Net::SMTP.class_eval do
  def self.start
    self.new.start
  end

  def self.new
    super(1)
  end

  def start
    @started = true
    return self
  end
end
