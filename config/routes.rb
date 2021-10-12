Rails.application.routes.draw do
  resources :hotels
  get 'home/index'
  devise_for :users
  root to: 'home#index'
end
