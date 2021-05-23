class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :current_user_product, only: [:destroy, :update, :edit]
  before_action :filter_out_current_user_products, only: [:index, :show_ps4, :show_ps5, :show_xboxxs, :show_xboxone, :show_switch, :show_other_consoles, :search_by_name]

  def index
    split_to_two_halves(@products)
  end

  def show
    @product = Product.all.find(params[:id])
    @products_with_same_name = []
    if current_user
      Product.all.each do |product|
        if product.name == @product.name and product != @product and !current_user.products.include? product
          @products_with_same_name.push(product)
        end
      end
    else
      Product.all.each do |product|
        if product.name == @product.name and product != @product
          @products_with_same_name.push(product)
        end
      end
    end
    @products_with_same_name_num = @products_with_same_name.length
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

  def show_ps4
    @ps4_products = @products.select { |product| product.console.downcase == "playstation 4"}
    split_to_two_halves(@ps4_products)
  end

  def show_ps5
    @ps5_products = @products.select { |product| product.console.downcase == "playstation 5"}
    split_to_two_halves(@ps5_products)
  end

  def show_switch
    @switch_products = @products.select { |product| product.console.downcase == "nintendo switch"}
    split_to_two_halves(@switch_products)
  end

  def show_xboxxs
    @xbox_products = @products.select { |product| product.console.downcase == "xbox x/s"}
    split_to_two_halves(@xbox_products)
  end

  def show_xboxone
    @xboxone_products = @products.select { |product| product.console.downcase == "xbox one"}
    split_to_two_halves(@xboxone_products)
  end

  def show_other_consoles
    major_consoles = ["playstation 4", "playstation 5", "nintendo switch", "xbox x/s", "xbox one"]
    @other_console_products = []
    @products.each do |product|
      if !major_consoles.include? product.console.downcase
        @other_console_products.push(product)
      end
    end
    split_to_two_halves(@other_console_products)
  end

  def search_by_name
    @search_result = []
    @products.each do |product|
      if product.name.downcase.include? params[:search].to_s.downcase
          @search_result.push(product)
      end
    end
    @num_of_items = @search_result.length
    split_to_two_halves(@search_result)
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :condition, :console, :cover, :search)
  end

  def current_user_product
    @product = current_user.products.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    flash[:alert] = "Not authorised"
    redirect_to root_path
  end

  def filter_out_current_user_products
    if current_user.present?
      @products = Product.all.select { |product| product[:user_id] != current_user.id }
    else
      @products = Product.all
    end
  end

  def split_to_two_halves(arr)
    @first_half = arr.first((arr.length.to_f/2).ceil).shuffle
    @second_half = arr.last((arr.length.to_f/2).floor).shuffle
  end
end