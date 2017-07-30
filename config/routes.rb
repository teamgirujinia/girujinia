Rails.application.routes.draw do


  devise_for :users, :controllers => {
   :registrations => 'users/registrations'
  }

  resources :projects do
    resources :comments, only: [:create, :destroy] # コメントをネスト
    resources :likes, only: [:create, :destroy] # いいね機能
  end
  
  root 'pages#index'
  resources :users, only: [:show]
  resources :socialstyles
  resources :tags do
  end
  
  # お問い合わせ
  get 'contact' => 'contact#index'
  post 'contact/confirm' => 'contact#confirm'
  post 'contact/thanks' => 'contact#thanks'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
