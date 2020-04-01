require 'pry'

class CashRegister
    attr_accessor :total, :discount, :items, :last_transaction

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(item, price, quantity = 1)
        
        self.total += price * quantity
        quantity.times do
            items << item
        end
    end

    def apply_discount
        if discount > 0
            discounted = (((100.0 - discount.to_f)/100.0) * total.to_f)
            discounted_price = total - discounted.to_i
#           binding.pry
            print discounted_price
            #self.total = total - discounted_price
            #    self.total = total * ((100 - discount)/100)
            puts "After the discount, the total comes to #{discounted_price}."
        else
            puts "There is no discount to apply."
        end
    end
     
    def void_last_transaction
        self.total = self.total - self.last_transaction
    end
    
end
