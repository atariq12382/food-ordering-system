class Restaurant < ApplicationRecord
  belongs_to :manager, class_name: "Employee", foreign_key: "manager_id"
  
  has_many :employees, class_name: 'Employee', foreign_key: 'restaurant_id'

  has_many :categories, class_name: 'Category', foreign_key: 'restaurant_id'

  has_many :deals, class_name: 'Deal', foreign_key: 'restaurant_id'

  has_many :discounts, class_name: "Discount", foreign_key: 'restaurant_id'
end
