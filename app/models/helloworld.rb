require 'haml' # template engine
require 'json'
require 'twilio-ruby'
require 'alchemy_api'

def vcap_services
  JSON.parse(ENV['VCAP_SERVICES'])
end

AlchemyAPI.key = vcap_services["alchemy_api"].first["credentials"]["apikey"]

post '/messages' do
  content_type "text/xml"

  sentiment = AlchemyAPI.search(:sentiment_analysis, text: params["Body"])

  case sentiment['type']
  when "positive"
    message = "Glad you're having gay day"
  when "negative"
    message = "Aww too bad eh"
  else
    message = "What sup dawg"
  end

  "
  <Response>
    <Message>#{message}</Message>
  </Response>
  "
end

get '/messages' do
  credentials = vcap_services['user-provided'].first['credentials']
  client = Twilio::REST::Client.new credentials['accountSID'], credentials['authToken']
  messages = client.messages.list :to => '+12568261204'
  return messages.map { |msg| "<p>#{msg.body}</p>" }.join
end


# control part of MVC
# an HTTP method paired with a URL-matching pattern
get '/' do
  # page variable
  @version = RUBY_VERSION
  @os = RUBY_PLATFORM
  @env = {}
  ENV.each do |key, value|
    begin
      hash = JSON.parse(value)
      @env[key] = hash
    rescue
      @env[key] = value
    end
  end

  #There are many useful environment variables available in process.env,
  #please refer to the following document for detailed description:
  #http://docs.cloudfoundry.com/docs/using/deploying-apps/environment-variable.html

  #VCAP_APPLICATION contains useful information about a deployed application.
  appInfo = @env["VCAP_APPLICATION"]

  #VCAP_SERVICES contains all the credentials of services bound to
  #this application. For details of its content, please refer to
  #the document or sample of each service.
  services = @env["VCAP_SERVICES"]
  #TODO: Get service credentials and communicate with bluemix services.

  # render template
  haml :hi
end
