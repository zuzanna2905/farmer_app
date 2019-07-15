class EmployeesController < ApplicationController
  before_action :find_employee, only: [:show, :edit, :update, :destroy]

  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
  end

  def create 
    @employee = current_user.employees.build(employee_params)
    if @employee.save
      redirect_to @employee
    else
      render 'new'
    end
  end

  def show
  end

  def update
    if @employee.update(employee_params)
      redirect_to @employee
    else
      render 'edit'
    end
  end

  def destroy
    @employee.destroy
    redirect_to employees_path
  end


  private 
    def find_employee
      @employee = Employee.find(params[:id])
    end

    def employee_params
      params.require(:employee).permit(:name, :start_date, :payment, :skills)
    end
end
