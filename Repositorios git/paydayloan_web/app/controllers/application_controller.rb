class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :select_layout

  before_action :configure_permitted_parameters, if: :devise_controller?

  # def after_sign_in_path_for(resource)
  #   dashboard_index_path
  # end

  def select_layout
  	if devise_controller? && action_name != "edit"
  		"devise_layout_html"
  	else
  		"application"
  	end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:telephone, :username, :first_name, :last_name, :password, :password_confirmation])
  	devise_parameter_sanitizer.permit(:account_update, keys: [:telephone, :username, :first_name, :last_name, :password, :password_confirmation, :current_password])
  end

end
