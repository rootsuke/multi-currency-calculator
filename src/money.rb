class Money
  attr_reader :amount

  def equals(money)
    @amount == money.amount && self.class.name == money.class.name
  end
  
end
