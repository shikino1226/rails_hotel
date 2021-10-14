Rails.application.routes.draw do

  devise_for :users
  root to: 'home#index'

  resources :hotels do
    collection do
      get 'search'
    end
  end
end
