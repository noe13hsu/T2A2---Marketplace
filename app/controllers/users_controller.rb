class UsersController < ApplicationController
  before_action :is_admin?, only: [:admin]
  # before the admin action is called, check if the user is admin

  def index
      
  end

  def show
    @user = current_user
    @products = current_user.products.select { |product| product.available }.sort_by{ |product| product.created_at }.reverse
    # selects current user's products that are available and sort them by created date in reversed order
    @num_of_products = @products.length
    # number of available products 
    @sold_products = current_user.products.select { |product| !product.available }.sort_by{ |product| product.created_at }.reverse
    # product.available will be set to false once a product becomes an order item, meaning that the product has been sold
    @num_of_sold_products = @sold_products.length
    # number of sold productss
  end

  def edit
    @user = current_user
  end

  def update
    if current_user.update(user_params)
      flash.notice = "User updated"
      redirect_to user_path
      # if current user is updated with the new params filled out in the edit form, a flash message will be displayed and redirects user to user_path
    else
      flash.now[:errors] = current_user.errors.full_messages
      render action: "edit"
      # displays flash error messages if data validation requirements are not met
    end
  end

  def destroy
    current_user.destroy
    flash.notice = "User deleted"
    redirect_to root_path
    # destroy currrent user record and display a flash notice and redirect user back to home page
  end

  def products
    available_products = current_user.products.select { |product| product.available}
    # select current user products that are available
    @products = available_products.sort_by{ |product| product.created_at }.reverse
    # reverse the order so product listed last will be displayed at the top
    @num_of_items = @products.length
    # number of available products
  end

  def admin
    if is_admin?
      @users = User.all
      @products = Product.all
      @num_of_users = @users.length
      @num_of_available_products = Product.all.select { |product| product.available }.length
      # number of available products
      @num_of_sold_products = Product.all.select { |product| !product.available }.length
      # number of sold products
      # this is for the admin dashboard, if an user has the admin role then the user has access to all user and product data
    else
      flash.alert = "Unauthorised action"
      redirect_to root_path
      # flash alert when a non admin user tries to access the admin dashboard by typing the /admin url
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :mobile, :location)
    # strong params used to update user details
  end

  def is_admin?
    current_user.has_role? :admin
    # checks if an user has the admin role
  end
end
