class Restaurant < ApplicationRecord
  belongs_to :manager, class_name: "Employee", foreign_key: "manager_id"
  
  has_many :employees, class_name: 'Employee', foreign_key: 'restaurant_id'
end
