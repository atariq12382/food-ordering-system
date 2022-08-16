class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :manager, class_name: 'Employee', optional: true
  # pay attention to pluralization
  has_many :employees, class_name: 'Employee', foreign_key: 'manager_id'

  has_one :restaurant, class_name: 'Restaurant', foreign_key: 'manager_id'

  belongs_to :restaurant,  class_name: "Restaurant", foreign_key: "restaurant_id"
  # calls the custom validation we will define later
  validate :manager_must_be_a_manager, unless: :manager?

  def manager?
    manager.nil?
  end

  private
    # our custom validation method
    def manager_must_be_a_manager
      errors.add(:manager, 'is not a manager') unless manager.manager?
    end
end
