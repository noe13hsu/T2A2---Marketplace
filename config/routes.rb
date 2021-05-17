Rails.application.routes.draw do
  devise_for :users

  root to: "products#index"
  
  resources :products, :users
 

 
  get "users/:id/your_products", to: "users#your_products", as: "your_products"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
