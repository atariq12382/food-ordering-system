class CategoriesController < ApplicationController
  before_action :authenticate_employee!
  def index
    @restaurant = current_employee.workrestaurant
    @getAllCat = @restaurant.categories
    @q = @getAllCat.ransack(params[:q])
    if params[:q].present?
      @categories = @q.result(distinct: true)
    else
      @categories = @getAllCat
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update(name: params[:category][:name])
    redirect_to categories_path
  end

  def new
    
  end
end