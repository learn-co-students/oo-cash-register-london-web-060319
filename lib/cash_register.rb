require "pry"

class CashRegister
    attr_accessor(:total, :discount)

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @everything = []
    end

    def add_item(title, price, *quantity)
        @everything <<  [title, quantity.first == nil ? price : price * quantity.first]
        quantity.first == nil ? @items << title : ("#{title} " * 3).split.each {|item| @items << item}
        quantity.first == nil ? @total += price : @total += price * quantity.first
    end

    def apply_discount
        if discount > 0
        @total = total - (total * (discount/100.0))
        "After the discount, the total comes to $#{total.to_i}."
        else "There is no discount to apply."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        @total -= @everything.last.last
    end
end

#ßbinding.pry