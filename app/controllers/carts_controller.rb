class CartsController < ApplicationController
    def show
        @cart_items = current_user.cart.cart_items.reverse
        @num_of_items = @cart_items.length
        @subtotal = 0
        current_user.cart.cart_items.each do |cart_item|
            @subtotal += cart_item.product.price.to_f
        end
    end
end
