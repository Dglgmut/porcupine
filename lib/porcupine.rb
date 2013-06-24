require 'net/smtp'

module Porcupine
  @@mail_queue = []

  Net::SMTP.class_eval do
    def start *args
      @started = true
      return self
    end

    def send_message(msgstr, from_addr, to_addrs)
      Porcupine::MailQueue << {msgstr: msgstr, from_addr: from_addr, to_addrs: to_addrs}
    end
  end

  class MailQueue
    @@queue = []
    def self.<<(x)
      @@queue << x
    end

    def self.content
      @@queue
    end
  end
end
