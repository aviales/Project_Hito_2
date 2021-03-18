Rails.application.routes.draw do
  resources :tweets do 
    resources :likes
    member do 
      post 'retweet'
      get 'retweet'
    end
  end

  devise_for :users
  root 'tweets#index'
end
