class CashRegister
    attr_accessor :discount, :total, :items, :last_transac

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity = 1)
        self.total += (price * quantity)

        quantity.times do
            @items << title
        end

        self.last_transac = price * quantity
    end

    def apply_discount
        if self.discount == 0
            "There is no discount to apply."
        else
            self.total = @total * (1.0 - (@discount / 100.0))
            "After the discount, the total comes to $#{@total.to_i}."
        end
    end

    def void_last_transaction
        self.total = @total - self.last_transac
    end
end

# Sample facts
cr1 = CashRegister.new(20)
cr1.add_item("macbook", 1000)
cr1.add_item("pc", 700)


