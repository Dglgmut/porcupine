require 'test/unit'
require 'porcupine'

class PorcupineTest < Test::Unit::TestCase
  def test_initialize
    assert_equal Porcupine,
      Porcupine.new.class
  end
end
