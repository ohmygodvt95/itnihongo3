Rails.application.routes.draw do
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
  resources :users, only: :show
  resources :search, only: :index
end
