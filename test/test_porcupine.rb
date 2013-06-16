require 'test/unit'
require 'debugger'
require 'porcupine'
require 'net/smtp'
require 'action_mailer'

class PorcupineTest < Test::Unit::TestCase
  def test_initialize
    assert_equal Porcupine,
      Porcupine.new.class
  end

  def test_stop_smtp_sending
    assert_nothing_raised do
      Net::SMTP.new()
    end
    n = Net::SMTP.new()
    assert_equal n.start.started?, true
  end

  def test_action_mailer_sending_to_the_mail_array
    debugger
    ActionMailer::Base.mail(:from => "me@example.com", :to => "you@example.com", :subject => "test", :body => "test").deliver
  end
end
