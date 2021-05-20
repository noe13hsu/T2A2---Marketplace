# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  after_action :create_cart, only: [:create]

  def create_cart
    Cart.create!(user_id: @user.id)
  end  
end
