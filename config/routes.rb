Rails.application.routes.draw do
  resources :tweets do 
    resources :friends
    resources :likes
    member do 
      post 'retweet'
      get 'retweet'
    end
  end

  get 'homes/index'

  devise_for :users
  root 'tweets#index'
end
