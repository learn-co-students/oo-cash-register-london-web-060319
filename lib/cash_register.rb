class CashRegister
    attr_accessor :discount, :total, :items, :last_transaction

    def initialize(discount=0)
        @discount = discount
        @items = []
        @total = 0 
    end

    def add_item(product_name, price, quantity=1)
        self.last_transaction = (quantity*price)
        self.total += (quantity*price)
        for product in 1..quantity do
            items << product_name
        end
    end
    
    def apply_discount
        if discount != 0
            self.total = (total * ((100.0-self.discount.to_f)/100)).to_i
            "After the discount, the total comes to $800."
        else
            "There is no discount to apply."
        end
    end
    
    def void_last_transaction
        self.total -= last_transaction
    end

end