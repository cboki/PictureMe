Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :photographers, only: [:index, :show]do
    resources :appointments, only: [:new, :create]
  end
  resources :appointments, only: [] do
    resources :reviews, only: [:new, :create]
  end
  resources :users, only: [] do
    resources :appointments, only: [:index]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
