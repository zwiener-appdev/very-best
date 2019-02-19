class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  # protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token, raise: false
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:username])

    devise_parameter_sanitizer.permit(:account_update, :keys => [:username])
  end
end
