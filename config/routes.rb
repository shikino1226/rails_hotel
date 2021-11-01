Rails.application.routes.draw do

  devise_for :users
  root to: 'hotels#home'

  resources :hotels do
    collection do
      get 'search'
    end
  end

  get 'home/index' => 'home#index'
  get 'home/index2' => 'home#index2'
  get 'home/profile' => 'home#profile'

  resources :reservations
  post 'reservations/new' => 'reservations#new'
end
