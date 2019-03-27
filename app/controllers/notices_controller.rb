class NoticesController < ApplicationController
  skip_after_action :verify_authorized
  
  def new
    @notice = Notice.new(notice_type: :notice)
  end
  
  def create
    Notice.create!(notice_params)
    redirect_to root_path
  end
  
  def notice_params
    params.require(:notice).permit(:notice_type, :message, :location, :contact, :image, :event_time)
  end

end
