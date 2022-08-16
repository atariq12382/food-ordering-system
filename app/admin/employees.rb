ActiveAdmin.register Employee do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
    filter :manager
    filter :workrestaurant

    index do
      column :id
      column :email
      column :name
      column :cnic
      column :address
      column :salary
      column :contact
      column :manager
      column :workrestaurant
      actions
    end

    form do |f|
      f.inputs :email, :password, :name, :cnic, :address, :salary, :contact, :manager, :workrestaurant 
      actions
    end
    permit_params :email, :password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name, :cnic, :address, :salary, :contact, :manager_id, :restaurant_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name, :cnic, :address, :salary, :contact, :manager_id, :restaurant_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
