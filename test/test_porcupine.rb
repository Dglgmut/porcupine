require 'test/unit'
require 'debugger'
require 'porcupine'
require 'action_mailer'

class PorcupineTest < Test::Unit::TestCase
  def test_initialize
    assert_equal Porcupine::MailQueue,
      Porcupine::MailQueue.new.class
  end

  def test_stop_smtp_sending
    h = {msgstr: 'test body',
         from_addr: 'from@example.com',
         to_addrs: ['dest@example.com', 'dest2@example.com']}
    Net::SMTP.new('test', 25).send_message(*h.values)
    assert_equal Porcupine::MailQueue.content.count, 1
    assert_equal Porcupine::MailQueue.content.first, h
  end
end
