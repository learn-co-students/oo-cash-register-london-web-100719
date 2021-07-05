class CashRegister
    attr_accessor :discount, :total, :items, :last_transac

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity = 1)
        @total += (price * quantity)

        quantity.times do
            @items << title
        end

        @last_transac = price * quantity
    end

    def apply_discount
        if @discount == 0
            "There is no discount to apply."
        else
            @total = @total * (1.0 - (@discount / 100.0))
            "After the discount, the total comes to $#{@total.to_i}."
        end
    end

    def void_last_transaction
        @total -= @last_transac
    end
end