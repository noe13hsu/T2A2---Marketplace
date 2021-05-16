Rails.application.routes.draw do
  devise_for :users

  root to: "products#index"
  
  get "users/:id/show_all_products", to: "users#show_all_products", as: "show_all_products"
  resources :products, :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
