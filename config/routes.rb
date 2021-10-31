Rails.application.routes.draw do

  devise_for :users
  root to: 'hotels#home'

  resources :hotels do
    collection do
      get 'search'
    end
  end

  resources :reserves
  post 'reserves/new' => 'reserves#new'
end
