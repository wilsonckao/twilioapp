Rails.application.routes.draw do

  resources :reviews
  devise_for :users

  resources :listings do
    resources :orders, only: [:new, :create]
  end

  get 'listings/index'
  get 'pages/about'
  get 'pages/contact'
  get 'seller' => "listings#seller"
  get 'sales' => "orders#sales"
  get 'purchases' => "orders#purchases"
  get 'twilio/index'

  root :to => 'twilio#index'
  post '/send_sms' => 'twilio#send_sms'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
