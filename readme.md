# Multi Currency Calculator

Multi Currency Calculator is a tool for addition, multiplication of multi currency made by Ruby.

Just launching Ruby executable environment by Docker, you can try the calculator.

## Building

```
git clone https://github.com/rootsuke/multi-currency-calculator.git
docker-compose build
docker-compose up
```

## Usage

* Multi Currency Addition
```
five_dollars = Money.dollar(5)
ten_francs = Money.franc(10)
bank = Bank.new
bank.add_rate("CHF", "USD", 2) # exchange 2 CHF into 1 USD.
sum = Sum.new(five_dollars, ten_francs).plus(five_dollars)
result = bank.reduce(sum, "USD")
=> 10 # you get 10 dollars.
```

* Multi Currency Multiplication
```
five_dollars = Money.dollar(5)
ten_francs = Money.franc(10)
bank = Bank.new
bank.add_rate("CHF", "USD", 2) # exchange 2 CHF into 1 USD.
product = Sum.new(five_dollars, ten_francs).times(five_dollars)
result = bank.reduce(product, "USD")
=> 20 # you get 20 dollars.
```

## Testing

```
rake test # run all tests.
```
