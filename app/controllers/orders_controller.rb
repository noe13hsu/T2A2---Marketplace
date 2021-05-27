class OrdersController < ApplicationController
    def create
        if current_user.cart.cart_items.all? { |cart_item| cart_item.product.available }
        # before an order is places, check whether all cart items are still available
            @order = Order.create!(user_id: current_user.id)
            # create order with current user id, order cant be made without a user id
            current_user.cart.cart_items.each do |cart_item|
                # loop through all cart items
                OrderItem.create!(order_id: @order.id, product_id: cart_item.product.id)
                # create order items with product id retrived from each cart item 
                cart_item.product.update(available: false)
                # update products that were in the cart to be unavailable
                cart_item.destroy
                # destroy the cart item
            end     
            @order_items = @order.order_items
            # set order items
            flash.notice = "Order placed"
            redirect_to show_user_cart_path
            # dispay a notice and redirect user to user cart view
        else
            current_user.cart.cart_items.each do |cart_item|
                # else if any products in cart is not available 
                if !cart_item.product.available
                    cart_item.destroy
                    # destroy that cart item
                end
            end
            flash.alert = "One or more items unavailable"
            redirect_to show_user_cart_path
            # display an alert and redirect user back to user cart view
        end
    end

    def show
        @orders = current_user.orders.sort_by{ |order| order.created_at }.reverse
        # reverse orders so the latest one shows at the top
        @num_of_orders = @orders.length
        # number of orders
    end
end
