class ChemicalsController < ApplicationController
  before_action :find_chemical, only: %i[show edit update destroy same_user]
  before_action :authenticate_user!
  before_action :same_user, except: %i[index new create]

  def index
    @chemicals = Chemical.where(user_id: current_user)
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

  def same_user
    return unless @chemical.user_id != current_user.id
      redirect_to chemicals_path
    end
  end
end
