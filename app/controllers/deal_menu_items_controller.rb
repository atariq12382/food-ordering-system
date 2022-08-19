class DealMenuItemsController < ApplicationController
  before_action :authenticate_employee!

  def index
    @restaurant = current_employee.workrestaurant
    @deals = @restaurant.deals
    @deal_menu_itemsAll = DealMenuItem.all
    @q = @deal_menu_itemsAll.ransack(params[:q])
    if params[:q].present?
      @deal_menu_items = @q.result(distinct: true)
    else
      @deal_menu_items = @deal_menu_itemsAll
    end
  end

  def destroy
    @deal_menu_itemDel = DealMenuItem.find(params[:id])
    @deal_menu_itemDel.destroy
    redirect_to deal_menu_items_path
    flash[:alert] = "Deal Item Deleted successfully"
  end

  def edit
    @deal_menu_item = DealMenuItem.find(params[:id])
    @restaurant = current_employee.workrestaurant
    @deals = @restaurant.deals
  end

  def update
    @deal_menu_item = DealMenuItem.find(params[:id])
    @deal_menu_item.update(name: params[:deal_menu_item][:name], status: params[:deal_menu_item][:status], image: params[:deal_menu_item][:image])
    redirect_to deal_menu_items_path
  end

  def new
    @restaurant = current_employee.workrestaurant
    @deals = @restaurant.deals
  end

  def create
    if params[:name].present?
      @deal_menu_itemFind = DealMenuItem.find_by(name: params[:name])
      if @deal_menu_itemFind
        redirect_to deal_menu_items_path
        flash[:alert] = "Deal Item already exists"
      else
        @deal_menu_item = DealMenuItem.create(name: params[:name], status: params[:status])
        @deal_menu_item.save
        redirect_to deal_menu_items_path
        flash[:notice] = "Deal Item added successfully"
      end
    end
  end

  def show
    @deal_menu_item = DealMenuItem.find(params[:id])
  end

  def detail
    @restaurant = current_employee.workrestaurant
    @deals = @restaurant.deals
    @deal_menu_items = DealMenuItem.all
  end

  def associate
    @dealDetail = DealDetail.create(deal_id: params[:deal], deal_menu_item_id: params[:deal_menu_item])
    redirect_to deal_menu_items_path
    flash[:notice] = "Deal Item added to Deal"
  end

end
