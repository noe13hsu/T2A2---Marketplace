class CartItemsController < ApplicationController
    def create
        if current_user.cart.cart_items.find_by(product_id: params[:id]).nil?
            @cart_item = CartItem.create!(cart_id: current_user.cart.id, product_id: params[:id])
            flash.notice = "Item added to cart"
        else
            flash.alert = "Item already in cart"
        end
        redirect_to root_path
    end

    def destroy
        current_user.cart.cart_items.find(params[:id]).destroy
        redirect_to show_user_cart_path
    end
end