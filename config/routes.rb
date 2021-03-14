Rails.application.routes.draw do

  devise_for :users
  root to: "home#index"

  resources :users
  resources :posts do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end

 get '/ranking' => 'posts#ranking'
 post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
 post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す

end
