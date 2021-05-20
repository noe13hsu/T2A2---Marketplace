Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :products

  root to: "products#index"

  patch "user", to: "users#update", as: "update_user_details"
  put "user", to: "users#update"
  delete "user", to: "users#destroy", as: "delete_user_account"
  get "user", to: "users#show", as: "show_user_details"
  get "user/edit", to: "users#edit", as: "edit_user_details"

  get "user/cart", to: "carts#show", as: "show_user_cart"

  get "user/products", to: "users#products", as: "show_user_products"

  post "user/cart/:id", to: "cart_items#create", as: "create_cart_item"
  delete "user/cart/:id", to: "cart_items#destroy", as: "delete_cart_item"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
