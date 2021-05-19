Rails.application.routes.draw do
  devise_for :users
  resources :products, :users

  root to: "products#index"

  get "users/:id/cart", to: "carts#show", as: "user_cart"

  get "users/:id/products", to: "users#products", as: "user_products"
  post "cart_items/:id", to: "cart_items#create"
  get "cart_items/:id", to: "cart_items#show", as: "cart_item"
  delete "cart_items/:id", to: "cart_items#destroy"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
