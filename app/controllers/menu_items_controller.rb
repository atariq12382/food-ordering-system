class MenuItemsController < ApplicationController
  before_action :authenticate_employee!
  def index
    @restaurant = current_employee.workrestaurant
    @categories = @restaurant.categories
    @menu_itemsAll = @restaurant.menu_items
    @q = @menu_itemsAll.ransack(params[:q])
    if params[:q].present?
      @menu_items = @q.result(distinct: true)
    else
      @menu_items = @menu_itemsAll
    end
  end

  def destroy
    @menu_itemDel = MenuItem.find(params[:id])
    @menu_itemDel.destroy
    redirect_to menu_items_path
    flash[:alert] = "Menu Item Deleted successfully"
  end

  def edit
    @menu_item = MenuItem.find(params[:id])
    @restaurant = current_employee.workrestaurant
    @categories = @restaurant.categories
  end

  def update
    @menu_item = MenuItem.find(params[:id])
    @menu_item.update(name: params[:menu_item][:name], price: params[:menu_item][:price], status: params[:menu_item][:status], category_id: params[:menu_item][:category], image: params[:menu_item][:image])
    redirect_to menu_items_path
  end

  def new
    @restaurant = current_employee.workrestaurant
    @categories = @restaurant.categories
  end

  def create
    if params[:name].present?
      @menu_itemFind = MenuItem.find_by(name: params[:name])
      if @menu_itemFind
        redirect_to menu_items_path
        flash[:alert] = "Menu Item already exists"
      else
        @categoryNew = MenuItem.create(name: params[:name], price: params[:price], status: params[:status], category_id: params[:category])
        @categoryNew.save
        redirect_to menu_items_path
        flash[:notice] = "Menu Item added successfully"
      end
    end
  end

  def show
    @menu_item = MenuItem.find(params[:id])
  end
end