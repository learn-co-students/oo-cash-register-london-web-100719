class CashRegister

    attr_accessor :total

    def initialize(discount=0)
        @total=0
        @discount=discount  
        @items=[]
        @last_transaction=[]
    end

    def discount
        @discount
    end

    def add_item(item,price,amount=1)
        @total += price*amount
        puts item
        amount.times do 
            @items.push(item)
            @last_transaction=[item,price,amount]
        end
        
    end

    def items
        @items
    end

    def apply_discount
        @total=@total*(100-discount)/100
        if discount==0
            "There is no discount to apply."
        else
            "After the discount, the total comes to $#{@total}."
        end
    end

    def void_last_transaction
        @items.pop
        @total = @total - @last_transaction[1] * @last_transaction[2]
    end

end