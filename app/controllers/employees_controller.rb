class EmployeesController < ApplicationController
  before_action :authenticate_employee!
  def index
    @restaurant = current_employee.workrestaurant
    @getAllEmp = @restaurant.employees
    @q = @getAllEmp.ransack(params[:q])
    if params[:q].present?
      @employees = @q.result(distinct: true)
    else
      @employees = @getAllEmp
    end
  end

  def new

  end

  def create
    if params[:email].present?  @category = Category.find(params[:id])
      @category = Category.find(params[:id])
      @category = Category.find(params[:id])
      @empFind = Employee.find_by(email: params[:email])
      if @empFind
        redirect_to employees_index_path
        flash[:alert] = "Employee already exists"
      else
        @empNew = Employee.create(name: params[:name], email: params[:email], cnic: params[:cnic], contact: params[:contact], address: params[:address], password: params[:password], manager_id:current_employee.id, restaurant_id: current_employee.restaurant_id)
        @empNew.save
        redirect_to employees_index_path
        flash[:notice] = "Employee added successfully"
      end
    end
  end

  def destroy
    @empDel = Employee.find(params[:id])
    @empDel.destroy
    redirect_to employees_index_path
    flash[:alert] = "Employee Deleted successfully"
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    @employee.update(name: params[:employee][:name], email: params[:employee][:email], cnic: params[:employee][:cnic], address: params[:employee][:address], salary: params[:employee][:salary], contact: params[:employee][:contact], image: params[:employee][:image])
    redirect_to employees_index_path
  end

  def solo
    @employee = Employee.find(params[:id])
  end
end
