class Restaurant < ApplicationRecord
  has_many :employees, class_name: 'Employee', foreign_key: 'restaurant_id'

  belongs_to :manager, class_name: "Employee", foreign_key: "manager_id", optional: true
  


  has_many :categories, class_name: 'Category', foreign_key: 'restaurant_id'

  has_many :deals, class_name: 'Deal', foreign_key: 'restaurant_id'

  has_many :discounts, class_name: "Discount", foreign_key: 'restaurant_id'

  has_many :orders, class_name: "Order", foreign_key: 'restaurant_id'

  has_many :menu_items, through: :categories
  has_many :deal_menu_items, through: :deals
end
