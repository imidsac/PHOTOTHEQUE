class ApplicationController < ActionController::Base
	#after_sign_in_path_for(:sign_in)
	#before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :configure_devise_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout 'slate'

  protected

  def configure_permitted_parameters
  	#devise_parameter_sanitizer.for(:sign_up) << :username
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :email) }
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit({ roles: [] }, :username, :email, :password, :password_confirmation) }
  
  end
  def configure_devise_permitted_parameters
    registration_params = [:nom, :prenom, :username, :email, :password, :password_confirmation, { roles: [] }]

    if params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) { 
        |u| u.permit(registration_params << :current_password)
      }
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) { 
        |u| u.permit(registration_params) 
      }
    end
  end
end
