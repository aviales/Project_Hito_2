Rails.application.routes.draw do
  resources :tweets do 
    resources :likes
  end

  devise_for :users
  root 'tweets#index'
end
