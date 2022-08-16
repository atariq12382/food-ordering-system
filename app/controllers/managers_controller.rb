class ManagersController < ApplicationController
  before_action :authenticate_employee!
  def dashboard
  end
end
