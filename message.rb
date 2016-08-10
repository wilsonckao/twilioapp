class MessageController < ApplicationController
  def new
    @msg = Message.new
  end

  def create
    @msg = Message.new(message_params)

    if @msg.save
      @msg.send_sms
      render json: {status: "success"}
    else
      render text: "Failed, please go back"
    end
  end

  def show
    @msg = Message.find params[:id]
  end

  def index
  end

  private
    def message_params
      params.require(:message).permit(:to_number, :body, :lat, :lon)
    end
end
```
