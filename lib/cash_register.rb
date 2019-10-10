
require 'pry'

class CashRegister

    attr_accessor :total, :discount

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @array_items =[]

    end

    def add_item(title, price, quantity = 1)
        self.total += price * quantity
        quantity.times {@array_items << title}
        @last_item = price * quantity
    end

    def apply_discount
        if @discount != 0
            self.total = ((100.0 - @discount)/100)*1000
            return "After the discount, the total comes to $#{@total.to_i}."
        else
            return "There is no discount to apply."
        end
    end

    def items
        @array_items
    end

    def void_last_transaction
        self.total = @total - @last_item

    end

end
