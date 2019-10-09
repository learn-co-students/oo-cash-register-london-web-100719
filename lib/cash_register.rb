class CashRegister

    attr_accessor :discount, :total, :items, :last_item_price 
    
    def initialize(discount = 0)
        @total = 0
        @discount = discount.to_f
        @items = []
    end 

    def add_item(title, price, quantity = 1)
        @total += price*quantity
        quantity.times do 
            @items << title 
        end 
        @last_item_price = price * quantity
    end 

    def apply_discount
        if @discount > 0 
            @total *= 1 - (@discount/100)
            "After the discount, the total comes to $800."
        else 
            "There is no discount to apply."
        end 
    end 

    def items
        @items 
    end 

    def void_last_transaction
        @total -= last_item_price
    end 
end 
