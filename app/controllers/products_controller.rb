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

  def new
    @product = current_user.products.build
  end

  def create
    @product = current_user.products.build(product_params)
    if @product.save
      redirect_to your_products_path(current_user)
    else
      flash.now[:errors] = @product.errors.full_messages
      render action: 'new'
    end
  end

  def edit

  end

  def update
    if @product.update(product_params)
      redirect_to your_products_path(current_user)
    else
      flash.now[:errors] = @product.errors.full_messages
      render action: 'edit'
    end
  end

  def destroy
    @product.destroy
    redirect_to your_products_path(current_user)
  end

  private

  def correct_user
    @product = current_user.products.find_by(id: params[:id])
    redirect_to root_path, alert: "Not Authorised" if @product.nil?
  end

  def product_params
    params.require(:product).permit(:name, :price, :condition, :console)
  end
end