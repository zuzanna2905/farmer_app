class FieldsController < ApplicationController
  before_action :find_field, only: [:show, :edit, :update, :destroy]
  before_action :same_user, except: [:index, :new, :create]

  def index
    @fields = Field.where(user_id: current_user)
  end

  def new
    @field = Field.new
  end

  def create 
    @field = current_user.fields.build(field_params)
    if @field.save
      redirect_to @field
    else
      render 'new'
    end
  end

  def show
  end

  def update
    if @field.update(field_params)
      redirect_to @field
    else
      render 'edit'
    end
  end

  def destroy
    @field.destroy
    redirect_to fields_path
  end

  private
    def find_field
      @field = Field.find(params[:id])
    end

    def field_params
      params.require(:field).permit(:year, :number, :area, :ownership, :name)
    end

    def same_user
      if @field.user_id != current_user.id
        redirect_to fields_path
      end
    end
end
