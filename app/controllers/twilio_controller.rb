class TwilioController < ApplicationController

  def index
    @history = Searchhistory.all
  end

  def send_sms
    message = params[:message]
    number = params[:number]


    @client = Twilio::REST::Client.new(ENV['ACCT_SID'], ENV['AUTH_TOKEN'])
    sms = @message = @client.account.messages.create({:to => "+1"+"#{number}",
    :from => "+12568261204",
    :body => "#{message}"})
    Searchhistory.create(message: message)
    puts sms.to

    # redirect_to '/'

  end
end
