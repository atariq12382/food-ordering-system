class DealsController < ApplicationController
  before_action :authenticate_employee!
  def index
    @restaurant = current_employee.workrestaurant
    @getAllCat = @restaurant.deals
    @q = @getAllCat.ransack(params[:q])
    if params[:q].present?
      @deals = @q.result(distinct: true)
    else
      @deals = @getAllCat
    end
  end

  def new
    
  end

  def create
    if params[:name].present?
      @dealFind = Deal.find_by(name: params[:name])
      if @dealFind
        redirect_to deals_path
        flash[:alert] = "Deal already exists"
      else
        @dealNew = Deal.create(name: params[:name], price: params[:price], restaurant_id: current_employee.restaurant_id)
        @dealNew.save
        redirect_to deals_path
        flash[:notice] = "Deal added successfully"
      end
    end
  end

  def edit
    @deal = Deal.find(params[:id])
  end

  def update
    @deal = Deal.find(params[:id])
    @deal.update(name: params[:deal][:name], price: params[:deal][:price])
    redirect_to deals_path
  end

  def show
    @deal = Deal.find(params[:id])
    @menu_items = @deal.deal_menu_items
  end

  def destroy
    @dealDel = Deal.find(params[:id])
    @dealDel.destroy
    redirect_to deals_path
    flash[:alert] = "Deal Deleted successfully"
  end
end
