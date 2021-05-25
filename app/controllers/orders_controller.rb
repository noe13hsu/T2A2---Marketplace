class OrdersController < ApplicationController
    def create
        if current_user.cart.cart_items.all? { |cart_item| cart_item.product.available }
            @order = Order.create!(user_id: current_user.id)
            current_user.cart.cart_items.each do |cart_item|
                OrderItem.create!(order_id: @order.id, product_id: cart_item.product.id)
                cart_item.product.update(available: false)
                cart_item.destroy
            end     
            @order_items = @order.order_items
            flash.notice = "Order placed"
            redirect_to show_user_cart_path
        else
            current_user.cart.cart_items.each do |cart_item|
                if !cart_item.product.available
                    cart_item.destroy
                end
            end
            flash.alert = "One or more items unavailable"
            redirect_to show_user_cart_path
        end
    end

    def show
        @orders = current_user.orders.reverse
        @num_of_orders = @orders.length
    end
end
