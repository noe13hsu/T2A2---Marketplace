class UsersController < ApplicationController
    before_action :correct_user, only: [:update, :show, :destroy, :edit, :show_all_products]
    
    def index
        
    end

    def show
        
    end

    def show_all_products

    end

    private

    def correct_user
        if params[:id] == current_user.id.to_s
            @user = User.find(params[:id])
        else
            redirect_to root_path, notice: "Not Authorised"
        end 
    end
end
