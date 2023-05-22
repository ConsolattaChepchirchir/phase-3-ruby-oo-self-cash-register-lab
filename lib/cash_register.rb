class CashRegister
    attr_accessor :total, :discount, :last_transaction, :items 
    # takes one optional argument, an employee discount, on initialization
    # sets an instance variable @total on initialization to zero
    # returns the current total
    def initialize(discount = 0)
        @total = 0 
        @discount = discount
        @items = []
    end
    # accepts a title and a price and increases the total
    # also accepts an optional quantity
    # doesn't forget about the previous total
    def add_item(title, price, quantity = 1 )
        self.last_transaction = price * quantity 
        self.total += self.last_transaction
        quantity.times do 
            self.items << title 
        end
    end
# when the cash register was initialized with an employee discount
#     applies the discount to the total price
#     returns success message with updated total
#     reduces the total
    def apply_discount
        if self.discount != 0 
            discount_as_percent = (100.0 - self.discount.to_f) / 100 
            self.total = (self.total * discount_as_percent).to_i 
             "After the discount, the total comes to $#{self.total}."
        else
            # returns a string error message that there is no discount to apply
          "There is no discount to apply."
        end
    end
    # subtracts the last item from the total
    # returns the total to 0.0 if all items have been removed
    def void_last_transaction
        self.total -= self.last_transaction
    end

end
