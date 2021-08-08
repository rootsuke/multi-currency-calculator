require "minitest/autorun"
require "test_helper"
require "dollar"
require "franc"

class MoneyTest < MiniTest::Test

  def test_multiplication
    five = Dollar.new(5)
    ten = Dollar.new(10)
    assert(five.times(2).equals(ten))
  
    fifteen = Dollar.new(15)
    assert(five.times(3).equals(fifteen))
  end

  def test_equality
    assert(Dollar.new(5).equals(Dollar.new(5)))
    assert_not(Dollar.new(5).equals(Dollar.new(6)))

    assert(Franc.new(5).equals(Franc.new(5)))
    assert_not(Franc.new(5).equals(Franc.new(6)))

    assert_not(Dollar.new(5).equals(Franc.new(5)))
  end

  def test_franc_multiplication
    five = Franc.new(5)
    ten = Franc.new(10)
    assert(five.times(2).equals(ten))
  
    fifteen = Franc.new(15)
    assert(five.times(3).equals(fifteen))
  end

end

