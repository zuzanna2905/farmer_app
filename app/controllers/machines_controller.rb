class MachinesController < ApplicationController
  before_action :find_machine, only: [:show, :edit, :update, :destroy]
  before_action :same_user, except: [:index, :new, :create]

  def index
    @machines = Machine.where(user_id: current_user)
  end

  def new
    @machine = Machine.new
  end

  def create 
    @machine = current_user.machines.build(machine_params)
    if @machine.save
      redirect_to @machine
    else
      render 'new'
    end
  end

  def show
  end

  def update
    if @machine.update(machine_params)
      redirect_to @machine
    else
      render 'edit'
    end
  end

  def destroy
    @machine.destroy
    redirect_to machines_path
  end

  private
    def find_machine
      @machine = Machine.find(params[:id])
    end

    def machine_params
      params.require(:machine).permit(:year, :name)
    end

    def same_user
      if @machine.user_id != current_user.id
        redirect_to machines_path
      end
    end
end