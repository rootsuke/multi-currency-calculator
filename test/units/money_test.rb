require "minitest/autorun"
require "test_helper"
require "money"

class MoneyTest < MiniTest::Test

  def test_multiplication
    five = Money.dollar(5)
    ten = Money.dollar(10)
    assert(five.times(2).equals(ten))
  
    fifteen = Money.dollar(15)
    assert(five.times(3).equals(fifteen))
  end

  def test_equality
    assert(Money.dollar(5).equals(Money.dollar(5)))
    assert_not(Money.dollar(5).equals(Money.dollar(6)))

    assert_not(Money.dollar(5).equals(Money.franc(5)))
  end

  def test_currency
    assert_equal("USD", Money.dollar(1).currency())
    assert_equal("CHF", Money.franc(1).currency())
  end

end

