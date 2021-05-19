class UsersController < ApplicationController
    before_action :correct_user, only: [:update, :show, :destroy, :edit, :products]
    
    def index
        
    end

    def show
        @products = @user.products
        @num_of_products = @products.length
    end

    def edit

    end
  
    def update
      if @user.update(user_params)
        redirect_to user_path(current_user)
      else
        flash.now[:errors] = @user.errors.full_messages
        render action: 'edit'
      end
    end

    def destroy
      @user.destroy
      redirect_to root_path
    end

    def products
        @products = @user.products.order(:created_at).reverse
    end

    private

    def correct_user
        if params[:id] == current_user.id.to_s
            @user = User.find(params[:id])
        else
            redirect_to root_path, alert: "Not Authorised"
        end 
    end

    def user_params
        params.require(:user).permit(:first_name, :last_name, :mobile, :location)
      end
end
