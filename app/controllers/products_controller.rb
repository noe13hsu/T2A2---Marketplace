class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :this_product, only: [:destroy, :update, :edit]

  def index
    if current_user.present?
      product_arr = Product.all.select { |product| product[:user_id] != current_user.id }
      @first_half = product_arr.first((product_arr.length.to_f/2).ceil).shuffle
      @second_half = product_arr.last((product_arr.length.to_f/2).ceil).shuffle
    else
      product_arr = Product.all
      @first_half = product_arr.first((product_arr.length.to_f/2).ceil).shuffle
      @second_half = product_arr.last((product_arr.length.to_f/2).ceil).shuffle
    end
  end

  def show
    @product = Product.all.find(params[:id])
  end

  def new
    @product = current_user.products.build
    authorize @product
  end

  def create
    @product = current_user.products.build(product_params)
    authorize @product
    if @product.save
      redirect_to show_user_products_path
    else
      flash.now[:errors] = @product.errors.full_messages
      render action: "new"
    end
  end

  def edit
  
  end

  def update
    if @product.update(product_params)
      redirect_to show_user_products_path
    else
      flash.now[:errors] = @product.errors.full_messages
      render action: "edit"
    end
  end

  def destroy
    @product.destroy
    redirect_to show_user_products_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :condition, :console, :cover)
  end

  def this_product
    @product = current_user.products.find(params[:id])
  end
end