Rails.application.routes.draw do
  get 'lectures/index'
  get 'lectures/new'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'posts/diet' => 'posts#diet'
  get 'posts/jobhunting' => 'posts#jobhunthing'
  get 'posts/study' => 'posts#study'
  get 'posts/saving' => 'posts#saving'
  get 'posts/cooking' => 'posts#cooking'
  get 'posts/others' => 'posts#others'

  resources :posts
  root 'posts#index' #さいしょにひょうじされるページ　
  

  resources :users, only: [:show] # ユーザーマイページへのルーティング

  resources :users, only: [:show] # ユーザーマイページへのルーティング
  


  
  





end

