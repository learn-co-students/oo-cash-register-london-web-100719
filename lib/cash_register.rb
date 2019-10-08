class CashRegister

    attr_accessor :total, :discount, :items, :last_item_price

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(item_name, price, quantity = 1)
        total_price = price * quantity
        self.total += total_price
        
        quantity.times do  
            self.items.push(item_name)
        end

        self.last_item_price = total_price
    end

    def apply_discount
        if self.discount > 0
            self.total = (0.8 * self.total).to_i
            return "After the discount, the total comes to $#{self.total}."
        elsif self.discount == 0
            return "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total -= self.last_item_price
    end
end
