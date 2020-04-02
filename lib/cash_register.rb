require 'pry'

class CashRegister
    attr_accessor :total, :discount, :items, :last_transaction

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @last_transaction = 0
    end

    def add_item(item, price, quantity = 1)
        @last_transaction = price * quantity
        self.total += last_transaction
        quantity.times do
            items << item
        end
    end

    def apply_discount
        if discount != 0
            self.total *= (100 - discount)/100.0
            self.total = self.total.to_i
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total -= @last_transaction
    end
end
