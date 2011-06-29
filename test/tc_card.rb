require 'test/unit'
require "#{File.dirname(__FILE__)}/../lib/card.rb"

class TC_Card < Test::Unit::TestCase
  def test_true
    assert_equal(true, true)
  end

end
