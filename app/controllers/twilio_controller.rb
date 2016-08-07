class TwilioController < ApplicationController

  def send_sms
    message = params[:message]
    number = params[:number]

    @client = Twilio::REST::Client.new account_sid, auth_token
    sms = @message = @client.account.messages.create({:to => "+1"+"#{number}",
    :from => "+12568261204",
    :body => "#{message}"})

    puts sms.to

    # redirect_to '/'

  end
end
