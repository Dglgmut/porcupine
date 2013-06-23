require 'test/unit'
require 'debugger'
require 'porcupine'
require 'net/smtp'
require 'action_mailer'

class PorcupineTest < Test::Unit::TestCase
  def test_initialize
    assert_equal Porcupine::Array,
      Porcupine::Array.new.class
    assert_equal Porcupine::Wrapper,
      Porcupine::Wrapper.new{}.class
  end

  def test_stop_smtp_sending
    assert_nothing_raised do
      Net::SMTP.new()
    end
    n = Net::SMTP.new()
    assert_equal n.start.started?, true
  end

  def test_action_mailer_sending_to_the_mail_array
    Porcupine::Wrapper.new do
      ActionMailer::Base.mail(:from => "me@example.com",
                              :to => "florez.renan@gmail.com",
                              :subject => "test",
                              :body => "test").deliver
    end
  end
end
