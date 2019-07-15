class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
  end

  def calculator
    @warehouses = current_user.warehouses
    @employees = current_user.employees
    @chemicals = current_user.chemicals
  end
end
