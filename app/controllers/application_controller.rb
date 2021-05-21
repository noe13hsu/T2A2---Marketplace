class ApplicationController < ActionController::Base
  include Pundit

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :mobile, :location])
  end

  rescue_from Pundit::NotAuthorizedError, with: :forbidden

  private
  def forbidden
    flash.alert = "Unauthorized action"
    redirect_to root_path
  end
end
