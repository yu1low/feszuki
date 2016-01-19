class EventsController < ApplicationController
  before_action :set_event, only: [:edit, :update]
  
  def show
    @event = Event.find(params[:id])
  end
  
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to @event
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @event.update(event_params)
        flash[:success] = "イベント情報を編集しました"
        redirect_to @event
      else
        render 'edit'
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :date, :address, :about)
  end
  
  def set_event
    @event = Event.find(params[:id])
  end
  
end