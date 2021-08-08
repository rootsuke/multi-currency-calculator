require "sum"
require "pair"

class Bank

  def initialize
    @rates = {}
  end

  def reduce(source, to)
    source.reduce(self, to)
  end

  def add_rate from, to, rate
    pair = Pair.new(from, to)
    @rates[pair.to_key] = rate
  end

  def rate from, to
    return 1 if from == to
    pair = Pair.new(from, to)
    @rates.fetch(pair.to_key)
  end

end
