class ApplicationController < ActionController::Base
  # Proteção contra CSRF
  protect_from_forgery
  # Requer autenticação do usuário
  before_action :authenticate_usuario!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:email, :password, :remember_me)
    end
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:nome, :email, :password, :remember_me)
    end
    devise_parameter_sanitizer.permit(:account_update) do |user_params|
      user_params.permit(:nome, :email, :password, :password_confirmation, :current_password)
    end
  end
end
