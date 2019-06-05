class CashRegister

    attr_accessor :total, :items, :last_transaction
    attr_reader :discount

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity = 1)
        self.total += price * quantity
        quantity.times { self.items << title }
        self.last_transaction = price * quantity
    end

    def apply_discount
        if self.discount == 0
            return "There is no discount to apply."
        end
        self.total = (self.total - self.total * (self.discount / 100.0))
        return "After the discount, the total comes to $#{self.total.to_i}."
    end

    def void_last_transaction
        self.total -= last_transaction
    end
end
