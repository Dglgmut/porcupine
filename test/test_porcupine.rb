require 'test/unit'
require 'porcupine'
require 'net/smtp'

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
end
