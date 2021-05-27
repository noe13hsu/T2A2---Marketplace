class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  # non registered users are allowed to accees index and show actions, but for the rest they need to sign up/log in
  before_action :current_user_product, only: [:destroy, :update, :edit]
  # check if a product belongs to the current user, in case someone tries to access a product that doesn't belong to them by typing url like /products/:id/edit to edit someone elses products
  before_action :filter_out_current_user_products, only: [:index, :show_ps4, :show_ps5, :show_xboxxs, :show_xboxone, :show_switch, :show_other_consoles, :search_by_name]
  # filters out current user products so current user wont see his products on home page/ console filtered pages / search results
  before_action :product_exist, only: [:show, :destroy, :update, :edit]

  def index
    split_to_two_halves(@products)
    # split all products into two halves for displaying in two swiper rows, also ensure the home page always displays some products from the first and second half
  end

  def show
    if @product.available
      # if the product being accessed is available
      @products_with_same_name = []
      # sets an empty array for storing products with the same name
      if current_user
        # if there is a current user
        Product.all.each do |product|
          if product.name == @product.name and product != @product and !current_user.products.include? product and product.available
            @products_with_same_name.push(product)
            # looping through all the available products to find products with the same name as the one current user is trying to access and products that dont belong to the current user
          end
        end
      else
        Product.all.each do |product|
          if product.name == @product.name and product != @product and product.available
            @products_with_same_name.push(product)
            # if there is no current user, then loop through all products to find products with the same name and are available
          end
        end
      end
      @products_with_same_name_num = @products_with_same_name.length
      # number of products with the same name
    else
      flash.alert = "Item not found"
      redirect_to root_path
      # if an user tries to access a product thats not available by typing the url
    end
  end

  def new
    @product = current_user.products.build
    # create a new product record with nil values
    authorize @product
    # pundit authorisation, only users with :genuine role can create new products
  end

  def create
    @product = current_user.products.build(product_params)
    # create a new product with the values entered by user
    @product.available = true
    # sets product availability to true
    authorize @product
    # pundit authorisation, only users with :genuine role can create new products
    if @product.save
      flash.notice = "Item created"
      redirect_to show_user_products_path
      # if product is saved, display a flash notice and redirects user to user product view
    else
      flash.now[:errors] = @product.errors.full_messages
      render action: "new"
      # if validation requirement is not met, then display error messages and redirect user back to the product form
    end
  end

  def edit
    if !@product.available
      flash.alert = "Item not found"
      redirect_to root_path
      # if user tries to access a product thats not available by typing the url, display an alert and redirects user back to home page
    end
  end

  def update
    if @product.available
      if @product.update(product_params)
        flash.notice = "Item updated"
        redirect_to show_user_products_path
        # if product is available and updated with the values passed in through product strong param, display a notice and redirects user to user products view
      else
        flash.now[:errors] = @product.errors.full_messages
        render action: "edit"
        # if not updated becasue validation requirement is not met, display error messages and redirect user to product form
      end
    else
      flash.alert = "Item not found"
      redirect_to root_path
      # when user tries to access a product thats not available by typing the product edit url, display alert and redirect user back to home page
    end
  end

  def destroy
    if @product.available
      @product.destroy
      flash.notice = "Item deleted"
      redirect_to show_user_products_path
      # if product is available, destroy the product and display a notice then redirect user to user products view
    else
      flash.alert = "Item not found"
      redirect_to root_path
      # if product is not available (sold), display alert and redirect user to home page 
    end
  end

  def show_ps4
    @ps4_products = @products.select { |product| product.console.downcase == "playstation 4" }
    split_to_two_halves(@ps4_products)
    # select products with console of playstation 4 and split them into two halves for display
  end

  def show_ps5
    @ps5_products = @products.select { |product| product.console.downcase == "playstation 5" }
    split_to_two_halves(@ps5_products)
    # select products with console of playstation 5 and split them into two halves for display
  end

  def show_switch
    @switch_products = @products.select { |product| product.console.downcase == "nintendo switch" }
    split_to_two_halves(@switch_products)
    # select products with console of nintendo switch and split them into two halves for display
  end

  def show_xboxxs
    @xbox_products = @products.select { |product| product.console.downcase == "xbox x/s" }
    split_to_two_halves(@xbox_products)
    # select products with console of xbox x/s and split them into two halves for display
  end

  def show_xboxone
    @xboxone_products = @products.select { |product| product.console.downcase == "xbox one" }
    split_to_two_halves(@xboxone_products)
    # select products with console of xbox one and split them into two halves for display
  end

  def show_other_consoles
    major_consoles = ["playstation 4", "playstation 5", "nintendo switch", "xbox x/s", "xbox one"]
    @other_console_products = []
    @products.each do |product|
      if !major_consoles.include? product.console.downcase
        @other_console_products.push(product)
      end
    end
    # loop through all products to find products that are not ps4, ps5, switch, xbox x/s, and xbox one products
    split_to_two_halves(@other_console_products)
    # split results into two halves for display
  end

  def search_by_name
    if params[:search] != ""
      # if user searches anything thats not "" (happens when they click on the search button without any input)
      @search_result = []
      @products.each do |product|
        if product.name.downcase.include? params[:search].to_s.downcase 
            @search_result.push(product)
        end
      end
      # loop through all products to find products that include the string user entered
      @num_of_items = @search_result.length
      # number of search results
      split_to_two_halves(@search_result)
      # split results into two halves for display
      @search = params[:search]
      # set @search to the search param which will be displayed when there is no results 
    else
      redirect_to root_path
      # redirect user to home page if they click on the search button without any input, which is the same as what amazon is doing
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :condition, :console, :cover, :search)
    # products strong params
  end

  def current_user_product
    @product = current_user.products.find(params[:id])
     # check if the product being accessed by typing the product url actually belongs to the current user
    rescue ActiveRecord::RecordNotFound
    flash[:alert] = "Unauthorised action"
    redirect_to root_path
    # display alert and redirect user back to home page if product is not found in the database
  end

  def product_exist
    @product = Product.all.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    flash[:alert] = "Product not found"
    redirect_to root_path
    # if user triese to access a product by typing the product url e.g. products/10000000 which does not exist, then rescue the error and display an alert and redirect user back to home page
  end

  def filter_out_current_user_products
    if current_user.present?
      @products = Product.all.select { |product| product[:user_id] != current_user.id and product.available }
    else
      @products = Product.all.select { |product| product.available }
    end
    # if current user is present, filter out current user products so they dont show up on home page, console filtered pages and search page
  end

  def split_to_two_halves(arr)
    @first_half = arr.first((arr.length.to_f/2).ceil).shuffle
    @second_half = arr.last((arr.length.to_f/2).floor).shuffle
  end
  # split products to two halves and randomise the display order
end