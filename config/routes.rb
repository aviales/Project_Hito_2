Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :tweets do 
    resources :friends
    resources :likes
    member do 
      post 'retweet'
      get 'retweet'
    end
  end

  get 'homes/index'
  get '/api/news' => 'api#news'
  get '/api/:fecha1/:fecha2' => 'api#tweet_filter'
  post '/api', action: :create, controller: 'api'


  devise_for :users
  root 'tweets#index'
end
