Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users

  unauthenticated  do
    root "static_pages#show", act: "home"
  end

  authenticated  do
    root "home#index"
  end
  get "/pages/:act" => "static_pages#show"

  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
  resources :users, only: :show do
    resources :followers, only: [:index]
    resources :following, only: [:index]
  end
  resources :search, only: :index
  resources :relationships, only: [:create, :destroy]
  resources :newsfeed, only: :index
end
