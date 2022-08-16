class ApplicationController < ActionController::Base
  # before_action :authenticate_admin_user!
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :cnic, :address, :salary, :contact, :manager_id])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name, :cnic, :address, :salary, :contact, :manager_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :cnic, :address, :salary, :contact, :manager_id])
  end
end
