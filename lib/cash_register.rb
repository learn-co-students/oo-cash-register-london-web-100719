require "pry"

class CashRegister
    attr_accessor :total, :discount, :void_last_transaction

    def initialize(discount=0)
        @total = 0
        @discount = discount.to_f
    end

    
    def add_item(item,price,quantity=1)
        @total += price*quantity
        if @all
        quantity.times {@all << item}
        @transactions << price*quantity
        else 
            @all = []
            @transactions = []
            quantity.times {@all << item} 
            @transactions << price*quantity
        end
    end

    def apply_discount
        if @discount.to_i == 0
            return "There is no discount to apply."
        else
            @total = @total * (1 - @discount/100)
            return "After the discount, the total comes to $#{total.to_i}." 
        end
    end

    def items
        @all
    end

    def void_last_transaction
        @total -= @transactions[-1]
        @all.pop
        @transactions.pop

    end

end
