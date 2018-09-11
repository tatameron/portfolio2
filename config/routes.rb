Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    root 'roots#top'
    get "/"=>"root#top"

get 'topics/index'
  get 'topics/show/:id' => 'topics#show', as: :topics_show
  post 'topics/create' => 'topics#create'
  delete 'topics/delete/:id' => 'topics#delete', as: :topic_delete
  post 'posts/create' => 'post#create', as: :post_create
  resources :users,only: [:show,:edit,:update,:destroy,:info] 
    resources :subs,only: [:new,:index,:show] 
     post 'subs/create' => 'subs#create'
     resources :cons,only: [:new,:index,:show]
          post 'cons/create' => 'cons#create'
          mount ActionCable.server => '/cable'
          # mount ActionCable.server => '/cable'
    end

