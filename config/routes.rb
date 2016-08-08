Rails.application.routes.draw do

  resources :orders
  devise_for :users
  get 'listings/index'

  resources :listings do
    resources :orders
  end

  get 'pages/about'

  get 'pages/contact'


  get 'twilio/index'

  root :to => 'twilio#index'
  post '/send_sms' => 'twilio#send_sms'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
