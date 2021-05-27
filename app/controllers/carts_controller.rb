class CartsController < ApplicationController
    def show
        @cart_items = current_user.cart.cart_items.sort_by{ |product| product.created_at }.reverse
        # reverse the order so lastest cart item shows at the top
        @num_of_items = @cart_items.length
        # number of cart items
        @subtotal = 0
        current_user.cart.cart_items.each do |cart_item|
            @subtotal += cart_item.product.price.to_f
            # loop through all the cart items to sum up the total price
        end
    end
end
