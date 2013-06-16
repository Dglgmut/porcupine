require 'net/smtp'

class Porcupine
  Net::SMTP.class_eval do
    def self.start
      self.new.start
    end

    def self.new(*arg)
      super(1)
    end

    def start(*arg)
      @started = true
      return self
    end
  end

end
