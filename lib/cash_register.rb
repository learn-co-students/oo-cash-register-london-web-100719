class CashRegister

  attr_accessor :items, :discount, :total, :last_transaction

  def initialize(discount=0)
    @discount = discount
    @total = 0
    @items = []
  end

  def add_item(title, price, quantity=1)
    quantity.times {self.items << title}
    self.total += quantity * price
    self.last_transaction = quantity * price
  end

  def apply_discount(discount=@discount) #e.g. discount=20
    if discount > 0
      self.total = self.total * (100 - discount)/100
      "After the discount, the total comes to $#{self.total}."
    else 
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total -= self.last_transaction
  end
end
