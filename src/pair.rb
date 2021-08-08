class Pair

  def initialize(from, to)
    @from = from
    @to = to
  end

  def inspect
    "#{@from}_#{@to}"
  end

  def to_key
    inspect
  end

  def equals(pair)
    @from.equals(pair.from) && @to.equals(pair.to)
  end

  def ==(pair)
    equals(pair)
  end

end
