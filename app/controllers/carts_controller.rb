class CartsController < ApplicationController
    # before_action :create

    def show
        @cart_items = current_user.cart.cart_items.reverse
        @num_of_items = @cart_items.length
        @subtotal = 0
        current_user.cart.cart_items.each do |cart_item|
            @subtotal += cart_item.product.price.to_f
        end
    end

    private
    def correct_user
        @cart = current_user.cart.find_by(id: params[:id])
        redirect_to root_path, alert: "Not Authorised" if @product.nil?
    end
end
