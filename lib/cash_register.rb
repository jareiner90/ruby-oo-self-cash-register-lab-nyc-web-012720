require 'pry'
class CashRegister

    attr_accessor :total, :discount

    def initialize(discount = 0)
        @discount = discount
        @total = 0
        @items = []
        @prices = []
    end 

    def add_item(item, price, quantity = 1)
        self.total += (price * quantity)
        @prices << price * quantity
        @items.concat([item]*quantity)

    end

    def apply_discount
        self.total *= (1 - 0.20)
        if self.total != 0
            "After the discount, the total comes to $#{self.total.to_i}."
        else 
            "There is no discount to apply."
        end

    end

    def items
        @items
    end

    def prices
        @prices
    end 

    def void_last_transaction
        # last_item_index = @items.length - 1
        last_item_price = @prices[-1]
        # binding.pry
        self.total = self.total - last_item_price
        return self.total
    end
end 