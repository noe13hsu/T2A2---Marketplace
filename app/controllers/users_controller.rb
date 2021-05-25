class UsersController < ApplicationController
  before_action :is_admin?, only: [:admin]

  def index
      
  end

  def show
    @user = current_user
    @products = current_user.products.select { |product| product.available }
    @num_of_products = @products.length
    @sold_products = current_user.products.select { |product| !product.available }
    @num_of_sold_products = @sold_products.length
  end

  def edit
    @user = current_user
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path
    else
      flash.now[:errors] = current_user.errors.full_messages
      render action: "edit"
    end
  end

  def destroy
    current_user.destroy
    redirect_to root_path
  end

  def products
    available_products = current_user.products.select { |product| product.available}
    @products = available_products.reverse
    @num_of_items = @products.length
  end

  def admin
    if is_admin?
      @users = User.all
      @products = Product.all
      @num_of_users = @users.length
      @num_of_available_products = Product.all.select { |product| product.available }.length
      @num_of_sold_products = Product.all.select { |product| !product.available }.length
    else
      flash.alert = "Not authorised"
      redirect_to root_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :mobile, :location)
  end

  def is_admin?
    current_user.has_role? :admin
  end
end
