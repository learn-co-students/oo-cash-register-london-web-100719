require "pry"

class CashRegister
  attr_accessor :total
  attr_reader :discount

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @transactions = []
  end

  def add_item(title, price, quantity = 1)
    @total += price * quantity
    quantity.times {@items << title}
    @transactions << price * quantity
  end

  def apply_discount
    if discount <= 0
      return "There is no discount to apply."
    end
    discount_factor = (100.to_f - @discount) / 100.to_f # e.g. 0.8 
    @total = (@total * discount_factor).to_i
    return "After the discount, the total comes to $#{@total}."
  end

  def items
    @items
  end

  def void_last_transaction
    last_transaction = @transactions.pop()
    @total -= last_transaction
  end

end