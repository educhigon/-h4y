Rails.application.routes.draw do
  devise_for :users

  root to: "posts#index"
  resources :posts, only: [:index, :show, :new, :create] do
    resources :favorites, only: [:create]
    resources :reviews, only: :create
    resources :comments, only: :create
  end

  resources :profiles, only: [:show, :new, :edit]
  resources :favorites, only: :destroy
  resources :health_data, only: [:create, :show, :new, :edit, :update]
  resources :reviews, only: :destroy
  resources :profiles, only: [:show, :new, :edit, :update]
  resources :searches, only: [:index]
  resources :tags, only: [:show]

  get "tag_search", to: "searches#tag_search"
  get "my_posts", to: "posts#my_posts"
  get "friend_posts/:id", to: "posts#friend_posts" , as: :friend_posts
  get "my_favorites", to: "posts#my_favorites"
  get "click_like/:id", to: "reviews#click_like", as: :click_like
  get "click_dislike/:id", to: "reviews#click_dislike", as: :click_dislike

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
