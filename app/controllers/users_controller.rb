class UsersController < ApplicationController
  def index
        
    end

    def show
        @user = current_user
        @products = current_user.products
        @num_of_products = @products.length
    end

    def edit
      @user = current_user
    end
  
    def update
      if current_user.update(user_params)
        redirect_to user_path
      else
        flash.now[:errors] = current_user.errors.full_messages
        render action: 'edit'
      end
    end

    def destroy
      current_user.destroy
      redirect_to root_path
    end

    def products
        @products = current_user.products.order(:created_at).reverse
    end

    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :mobile, :location)
    end
end
