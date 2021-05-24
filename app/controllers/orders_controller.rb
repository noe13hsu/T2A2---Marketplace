class OrdersController < ApplicationController
    def create
        @order = Order.create!(user_id: current_user.id)
        current_user.cart.cart_items.each do |cart_item|
            OrderItem.create!(order_id: @order.id, product_id: cart_item.product.id)
            cart_item.product.update(available: false)
            cart_item.destroy
        end     
        @order_items = @order.order_items
        flash.notice = "Order placed"
        redirect_to show_user_cart_path
    end

    def show
        @orders = current_user.orders
    end
end
