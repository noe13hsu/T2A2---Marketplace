# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  after_action :create_cart, only: [:create]
  after_action :add_genuine, only: [:create]

  def create_cart
    Cart.create!(user_id: @user.id)
  end

  def add_genuine
    @user.add_role :genuine
  end
end
