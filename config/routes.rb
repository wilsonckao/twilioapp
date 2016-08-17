Rails.application.routes.draw do

  get 'homes/show'

  resources :charts, only: [] do
  collection do
    get 'sporters_by_age'
    get 'sporters_by_country'
    get 'results_by_country'
    get 'competitions_by_year'
  end
end

  resources :reviews, except: [:show, :index]
  devise_for :users

  resources :chat_rooms, only: [:new, :create, :show, :index]


  resources :restaurants do
    resources :reviews, except: [:show, :index]
  end
  resources :listings do
    resources :orders, only: [:new, :create]
  end

  namespace :api do
  resources :items, only: [] do
    resources :click_tracks, only: [:create] do
      collection do
        get 'by_day'
      end
    end
  end
end


  get 'listings/index'
  get 'pages/about'
  get 'pages/contact'
  get 'seller' => "listings#seller"
  get 'sales' => "orders#sales"
  get 'purchases' => "orders#purchases"
  get 'twilio/index'
  get '/homes' => "homes#show"
  get '/day' => "homes#visits_by_day"
  get '/click' => "click_tracks#index"
  root :to => 'twilio#index'
  post '/send_sms' => 'twilio#send_sms'
  post 'tokens' => "tokens#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
