class CartItemsController < ApplicationController
    def create
        if current_user.cart.cart_items.find_by(product_id: params[:id]).nil?
            # find in cart whether the product is in cart or not, and if not....
            @cart_item = CartItem.create!(cart_id: current_user.cart.id, product_id: params[:id])
            # create a new cart item linked to current user cart and product
            flash.notice = "Item added to cart"
            # display a notice if successfully created a cart item
        else
            flash.alert = "Item already in cart"
            # if product already in cart then only display an alert
        end
        redirect_to root_path
        # either way, redirect user back to home page
    end

    def destroy
        current_user.cart.cart_items.find(params[:id]).destroy
        redirect_to show_user_cart_path
        # destroy current user cart item and redirect to user cart view
    end
end