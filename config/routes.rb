Rails.application.routes.draw do
  devise_for :users
  
  root to: "posts#index"
  resources :posts, only: [:index, :show, :new, :create] do
    resources :profile, only: [:new, :edit]
    resources :favorites, only: [:index, :create]
    resources :reviews, only: :create
  end
  resources :favorites, only: :destroy
  resources :reviews, only: :destroy

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
