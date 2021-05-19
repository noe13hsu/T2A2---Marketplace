class CartsController < ApplicationController
    before_action :create

    def show
        if current_user.cart.cart_items.length > 0
            current_cart_items = current_user.cart.cart_items
            @cart_items = current_cart_items.reverse
            @num_of_items = @cart_items.length
            @subtotal = 0
            current_cart_items.each do |cart_item|
                @subtotal += cart_item.product.price.to_f
            end
        else
            @num_of_items = 0
        end
    end

    def create
        if current_user.cart.nil?
            @cart = Cart.create!(user_id: current_user.id)
        end
    end

    private
    def correct_user
        @cart = current_user.cart.find_by(id: params[:id])
        redirect_to root_path, alert: "Not Authorised" if @product.nil?
    end
end
