
class CashRegister
    attr_accessor :total, :discount, :title, :price

    def initialize(@total = 0, discount = 0) 
        @discount = discount
    end 

    def add_item(title, quantity = 1, price)
        @total += (quantity*price) 
    end 

    def apply_discount 
        if @discount > 0
            @total *= (1 - (@discount/100))
            puts "After the discount, the total comes to $#{self.total}"
        else 
            puts "There is no discount to apply."
        end 
    end 


end 