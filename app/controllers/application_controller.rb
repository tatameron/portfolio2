class ApplicationController < ActionController::Base
protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    root_path
  end
  def after_sign_up_path_for(resource)
    root_path
  end
  def after_sign_out_path_for(resource)
    root_path
  end

before_action :set_current_user

def set_current_user
  @current_user = User.find_by(id: session[:user_id])
end
  before_action :configure_permitted_parameters, if: :devise_controller? 
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:post,:address])
  end
end

