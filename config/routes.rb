Rails.application.routes.draw do


  devise_for :users, :controllers => {
   :registrations => 'users/registrations'
  }

  # プロジェクト
  resources :projects do
    resource :picks, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy] # いいね機能
    resources :comments, only: [:create, :destroy] # コメントをネスト
    resources :entries, only: [:create, :destroy] do
      member do
        post 'approval' => 'entries#approval'
        post 'disapproval' => 'entries#disapproval'
      end
    end
    member do
       get :pick_users
    end
  end

  # ユーザー
  resources :users, only: [:show] do
    member do
      get 'show_recruit' => 'users#show_recruit'
      get 'show_entry' => 'users#show_entry'
      get 'show_member' => 'users#show_member'
      get 'show_pick' => 'users#show_pick'
      get :pick_projects
    end
  end
  
  root 'pages#index'

  resources :socialstyles
  resources :tags do
  end

  # お問い合わせ
  get 'contact' => 'contact#index'
  post 'contact/confirm' => 'contact#confirm'
  post 'contact/thanks' => 'contact#thanks'

  # ホーム関連ページ
  get 'sudden' => 'pages#sudden'
  get 'wanted' => 'pages#wanted'
  get 'doing' => 'pages#doing'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
