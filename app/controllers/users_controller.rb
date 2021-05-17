class UsersController < ApplicationController
    before_action :correct_user, only: [:update, :show, :destroy, :edit, :your_products]
    
    def index
        
    end

    def show
        
    end

    def your_products

    end

    private

    def correct_user
        if params[:id] == current_user.id.to_s
            @user = User.find(params[:id])
        else
            redirect_to root_path, alert: "Not Authorised"
        end 
    end
end
