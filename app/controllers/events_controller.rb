class EventsController < ApplicationController
  before_action :find_event, only: [:show, :edit, :update, :destroy, :same_user]
  before_action :authenticate_user!
  before_action :same_user, except: [:index, :new, :create]

  def index
    @events = Event.where(user_id: current_user)
  end

  def new
    @event = Event.new
  end

  def create 
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to @event
    else
      render 'new'
    end
  end

  def show
  end

  def update
    if @event.update(event_params)
      redirect_to @event
    else
      render 'edit'
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  private
    def find_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:date, :time, :name, :chemical_id, :machine_id, :field_id, :employee_id)
    end

    def same_user
      if @event.user_id != current_user.id
        redirect_to events_path
      end
    end
end
