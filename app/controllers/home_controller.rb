class HomeController < ApplicationController
  def index
    @convo = Message.all
  end
  def create
    @message = Message.new(message_params)

    if @message.save
      render json: @message
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  def message_params
    params.require(:message).permit(:text)
  end
end
