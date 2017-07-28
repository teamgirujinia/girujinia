Rails.application.routes.draw do
  devise_for :users
  resources :projects do
    resources :comments, only: [:create, :destroy] # コメントをネスト
    resources :likes, only: [:create, :destroy] # いいね機能
  end
  
  root 'projects#index'
  resources :users, only: [:show]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
