class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def index
    product_arr = Product.all
    @first_half = product_arr.first(product_arr.length/2.round).sample(10)
    @second_half = product_arr.last(product_arr.length/2.round).sample(10)
  end

  def show
    @product = Product.find(params[:id])
  end

  # def new
  #   @product = current_user.friends.build
  # end

  # def create
  #   @product = current_user.friends.build(product_params)
  # end

  def edit

  end

  def update

  end

  def destroy
    @product.destroy
    redirect_to show_all_products_path(current_user)
  end

  private

  def correct_user
    @product = current_user.products.find_by(id: params[:id])
    redirect_to root_path, notice: "Not Authorised" if @product.nil?
  end
end