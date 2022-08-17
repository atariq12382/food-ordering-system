class CategoriesController < ApplicationController
  before_action :authenticate_employee!
  def index
    @restaurant = current_employee.workrestaurant
    @categories = @restaurant.categories
  end
end