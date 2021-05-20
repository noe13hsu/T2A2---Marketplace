class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

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
      redirect_to show_user_products_path
    else
      flash.now[:errors] = @product.errors.full_messages
      render action: 'new'
    end
  end

  def edit
    @product = current_user.products.find(params[:id])
  end

  def update
    if current_user.products.find(params[:id]).update(product_params)
      redirect_to show_user_products_path
    else
      flash.now[:errors] = @product.errors.full_messages
      render action: 'edit'
    end
  end

  def destroy
    current_user.products.find(params[:id]).destroy
    redirect_to show_user_products_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :condition, :console)
  end
end