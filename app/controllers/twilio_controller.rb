class TwilioController < ApplicationController

  def send_sms
    message = params[:message]
    number = params[:number]
    account_sid = 'AC7b1b128b297fc7d063fedd51ebb29132'
    auth_token = '5d76cfe3da6d0b731c29d92ac80070f0'

    @client = Twilio::REST::Client.new account_sid, auth_token
    sms = @message = @client.account.messages.create({:to => "+1"+"#{number}",
    :from => "+12568261204",
    :body => "#{message}"})

    puts sms.to

    # redirect_to '/'

  end
end
