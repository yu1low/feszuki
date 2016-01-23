class EcommentsController < ApplicationController
    
  def create
    @event = Event.find(params[:event_id])
    @ecomment = Ecomment.new(ecomment_params)
    @ecomment.event = @event
    @ecomment.user = current_user
    if @ecomment.save
      flash[:success] = "コメントしました。"
      redirect_to root_path
    else
      render @event
    end
  end
  
  private
  
  def ecomment_params
    params.require(:ecomment).permit(:content)
  end
  
end
