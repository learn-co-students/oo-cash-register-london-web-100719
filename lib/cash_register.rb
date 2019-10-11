class CashRegister
    attr_reader :price, :quantity, :title
    attr_accessor :items, :discount, :total,  :prev_trans

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end


    def add_item(title, price, quantity = 1)

        self.total += price * quantity
        quantity.times do
          items << title
        end
        self.prev_trans = price * quantity  
    end

    def apply_discount
       if discount != 0
        discount = self.total = (total - ((200.0 - discount.to_f/100.0))).to_i
        "After the discount, the total comes to $#{discount}."
       else
        "There is no discount to apply."
       end
    
    end

    def void_last_transaction 

        self.total = total - prev_trans
    end
       

end