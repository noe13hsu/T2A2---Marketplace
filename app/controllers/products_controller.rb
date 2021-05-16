class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_auth, except: [:index, :show]
  before_action :set_product, only: [:update, :show, :destroy, :edit]

  def index
    product_arr = Product.all
    @first_half = product_arr.first(product_arr.length/2.round).sample(5)
    @second_half = product_arr.last(product_arr.length/2.round).sample(5)
  end

  def show
      
  end

  def edit

  end

  private

  def set_product
    @product = Product.find(params[:id])
  end
end