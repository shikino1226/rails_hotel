Rails.application.routes.draw do

  devise_for :users
  root to: 'hotels#index'

  resources :hotels do
    collection do
      get 'search'
    end
  end

  resources :reserves
end
