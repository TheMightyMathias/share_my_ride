class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @trip = Trip.find(params[:trip_id])
    @message.trip = @trip
    @message.user = current_user
    if @message.save
      respond_to do |format|
        format.html { redirect_to trip_path(@trip) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render "chat_rooms/show" }
        format.js
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
