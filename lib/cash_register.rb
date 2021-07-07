require 'pry'
class CashRegister
    attr_accessor :total, :discount, :price, :items, :last_transaction_amount

    def initialize(discount = nil)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity=1)
        i = 0
        if quantity > 1
            while i < quantity 
                @items << title
                i += 1
            end
            else
                @items << title
        end
        @total += price * quantity
        @last_transaction_amount = @total
        
    end
        
    

    def apply_discount
        if self.discount == nil
            "There is no discount to apply."
        else
            discount_amount = @total * @discount / 100
            @total -= discount_amount
            "After the discount, the total comes to $#{@total}." 
        end
    end

    def void_last_transaction
        @total -= @last_transaction_amount
    end


end