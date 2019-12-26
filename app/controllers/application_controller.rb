class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  # skip_before_action :verify_authenticity_token, :if => :json_request?

  protect_from_forgery with: :exception

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sing_up) {|u| u.permit(:name, :last_name, :date_birth, :rol, :email, :password, :password_confirmation)}
    devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:name, :last_name, :date_birth, :rol, :email, :password, :password_confirmation)}
  end
end
