class ChemicalsController < ApplicationController
  before_action :find_chemical, only: [:show, :edit, :update, :destroy]
  def index
    @chemicals = Chemical.all
  end

  def new
    @chemical = Chemical.new
  end

  def create 
    @chemical = current_user.chemicals.build(chemical_params)
    if @chemical.save
      redirect_to @chemical
    else
      render 'new'
    end
  end

  def show
  end

  def update
    if @chemical.update(chemical_params)
      redirect_to @chemical
    else
      render 'edit'
    end
  end

  def destroy
    @chemical.destroy
    redirect_to chemicals_path
  end

  private
    def find_chemical
      @chemical = Chemical.find(params[:id])
    end

    def chemical_params
      params.require(:chemical).permit(:expiration_date, :name, :volume, :volume_left)
    end

end
