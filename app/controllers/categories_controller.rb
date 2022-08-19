class CategoriesController < ApplicationController
  before_action :authenticate_employee!
  before_action :set_category
  
end

def show
  def index
    restaurant = current_employee.workrestaurant.categories.ransack(params[:q])
    @categories = @q.result(distinct: true)
  end

  def edit
  end

  def update
    @category.update(name: params[:category][:name])
    redirect_to categories_path
  end

  def new
    
  end

  def create
    if params[:name].present?
      @categoryFind = Category.find_by(name: params[:name])
      if @categoryFind
        redirect_to categories_path
        flash[:alert] = "Category already exists"
      else
        @categoryNew = Category.create(name: params[:name], restaurant_id: current_employee.restaurant_id)
        @categoryNew.save
        redirect_to categories_path
        flash[:notice] = "Category added successfully"
      end
    end
  end

  def destroy
    @categoryDel = Category.find(params[:id])
    @categoryDel.destroy
    redirect_to categories_path
    flash[:alert] = "Category Deleted successfully"
  end
end