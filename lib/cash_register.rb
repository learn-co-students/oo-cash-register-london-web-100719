require "pry"

class CashRegister

    attr_accessor :discount, :total, :price, :quantity, :last_item, :current_items

    def initialize(discount = nil)
        @discount = discount
        @total = 0
        @current_items = []
    end

    def add_item(item, price, quantity = 1)
        @item = item
        quantity.times { @current_items << item }
        @price = price
        @quantity = quantity
        @total += quantity * price
        @last_item = [item, price, quantity]
    end

    def items
        @current_items
    end

    def apply_discount
        if @discount
            @total = (@total * (100 - discount) / 100.00)
            @total = @total.to_i
            "After the discount, the total comes to $#{total}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        @current_items.delete_at(-1)
        if @current_items.length == 0
            @total = 0.0
        else
            @total -= @last_item[1] * @last_item[2]
        end
    end
end
