class CashRegister

    attr_accessor :total, :discount, :items, :last_item

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity = 1)
        @total += price * quantity
        quantity.times do
            @items << {title: title, price: price, quantity: quantity}
        end
        @last_item = @items[-1]
    end

    def apply_discount
        if @discount > 0
            @total = @total *  (1 - (@discount / 100.0))

        else
            return "There is no discount to apply."
        end

        return "After the discount, the total comes to $#{@total.to_i}."
    end

    def items
        arr = []
        @items.each do |element|
            arr << element[:title]
        end
        return arr
    end

    def void_last_transaction
        @total -= (@last_item[:price] * @last_item[:quantity])
    end

end