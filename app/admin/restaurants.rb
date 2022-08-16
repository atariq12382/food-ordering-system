ActiveAdmin.register Restaurant do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
    filter :name
    filter :owner
    filter :status

    index do
      column :id
      column :name
      column :owner
      column :perCut
      column :openingHours
      column :closingHours
      column :status
      column :manager
      actions
    end

    form do |f|
      f.inputs :name, :owner, :perCut, :openingHours, :closingHours, :status, :manager
      actions
    end

    permit_params :name, :owner, :perCut, :openingHours, :closingHours, :status, :manager_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :owner, :perCut, :openingHours, :closingHours, :status, :manager_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
