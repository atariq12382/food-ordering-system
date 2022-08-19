class ApplicationController < ActionController::Base
  # before_action :authenticate_admin_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :cnic, :address, :salary, :contact, :manager_id])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name, :cnic, :address, :salary, :contact, :manager_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :cnic, :address, :salary, :contact, :manager_id])
  end

  def after_sign_in_path_for(resource)
    if current_employee.manager_id != nil && current_employee.restaurant_id != nil
      welcome_index_path
    else
      root_path
    end
    
  end

  def after_sign_up_path_for(resource)
    if current_employee.manager_id != nil && current_employee.restaurant_id != nil
      welcome_index_path
    else
      root_path
    end
    
  end
  
end
