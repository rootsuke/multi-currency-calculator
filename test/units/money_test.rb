require "minitest/autorun"
require "test_helper"
require "money"
require "bank"

class MoneyTest < MiniTest::Test

  def test_multiplication
    five = Money.dollar(5)
    ten = Money.dollar(10)
    assert_equal(ten, five.times(2))
  
    fifteen = Money.dollar(15)
    assert_equal(fifteen, five.times(3))
  end

  def test_equality
    assert(Money.dollar(5), Money.dollar(5))
    assert_not_equal(Money.dollar(5), Money.dollar(6))

    assert_not_equal(Money.dollar(5), Money.franc(5))
  end

  def test_currency
    assert_equal("USD", Money.dollar(1).currency())
    assert_equal("CHF", Money.franc(1).currency())
  end

  def test_simple_addition
    five = Money.dollar(5)
    sum = five.plus(five)
    bank = Bank.new
    reduced = bank.reduce(sum, "USD")

    assert(reduced.equals(Money.dollar(10)))
  end

  def test_plus_returns_sum
    five = Money.dollar(5)
    sum = five.plus(five)

    assert(five.equals(sum.augend))
    assert(five.equals(sum.addend))
  end

  def test_reduce_sum
    sum = Sum.new(Money.dollar(3), Money.dollar(4))
    bank = Bank.new
    result = bank.reduce(sum, "USD")

    assert(result.equals(Money.dollar(7)))
  end

  def test_reduce_money
    bank = Bank.new
    result = bank.reduce(Money.dollar(1), "USD")

    assert(result.equals(Money.dollar(1)))
  end

  def test_reduce_money_different_currency
    bank = Bank.new
    bank.add_rate("CHF", "USD", 2)
    result = bank.reduce(Money.franc(2), "USD")

    assert(result.equals(Money.dollar(1)))
  end

  def test_indentify_rate
    bank = Bank.new
    assert_equal(1, bank.rate("USD", "USD"))
  end

  def test_mixed_addtion
    five_dollar = Money.dollar(5)
    ten_franc = Money.franc(10)
    bank = Bank.new
    bank.add_rate("CHF", "USD", 2)
    sum = five_dollar.plus(ten_franc)
    result = bank.reduce(sum, "USD")

    assert_equal(Money.dollar(10), result)
  end

  def test_sum_plus_money
    five_dollar = Money.dollar(5)
    ten_franc = Money.franc(10)
    bank = Bank.new
    bank.add_rate("CHF", "USD", 2)
    sum = Sum.new(five_dollar, ten_franc).plus(five_dollar)
    result = bank.reduce(sum, "USD")

    assert_equal(Money.dollar(15), result)
  end

  def test_sum_times
    five_dollar = Money.dollar(5)
    ten_franc = Money.franc(10)
    bank = Bank.new
    bank.add_rate("CHF", "USD", 2)
    sum = Sum.new(five_dollar, ten_franc).times(2)
    result = bank.reduce(sum, "USD")

    assert_equal(Money.dollar(20), result)
  end

end

