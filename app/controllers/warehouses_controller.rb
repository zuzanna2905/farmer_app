class WarehousesController < ApplicationController
  before_action :find_warehouse, only: [:show, :edit, :update, :destroy]
  def index
    @warehouses = Warehouse.all
  end

  def new
    @warehouse = Warehouse.new
  end

  def create 
    @warehouse = current_user.warehouses.build(warehouse_params)
    if @warehouse.save
      redirect_to @warehouse
    else
      render 'new'
    end
  end

  def show
  end

  def update
    if @warehouse.update(warehouse_params)
      redirect_to @warehouse
    else
      render 'edit'
    end
  end

  def destroy
    @warehouse.destroy
    redirect_to warehouses_path
  end

  private
    def find_warehouse
      @warehouse = Warehouse.find(params[:id])
    end

    def warehouse_params
      params.require(:warehouse).permit(:items, :name, :volume, :volume_left)
    end
end