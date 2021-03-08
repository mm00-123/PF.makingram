Rails.application.routes.draw do

  devise_for :users
  root to: "home#index"

  resources :users
  resources :posts do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end

end
