Rails.application.routes.draw do
  
  #get "admin/admins" => "admin/admins#index", as: "admin_admins"
  
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "users/registrations",
    sessions: 'users/sessions'
  }
  
  
  
  devise_scope :user do
    post "/guest_login" => "users/sessions#guest_sign_in"
  end
  
  scope module: :public do
    root to: "homes#top"
    get "homes/about" => "homes#about"
    get "users/mypage"=> 'users#show', as: 'users_mypage'
    post 'posts' => 'posts#create'
    get 'posts/new'
    get 'posts/:id' => 'posts#show', as: 'post'
    get 'posts/:id/edit' => 'posts#edit', as: 'edit_post'
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all', as: 'destroy_all_cart_item'
    get "search_tag" => "post_workouts#search_tag"
    resources :posts do
      resources :comments, only: [:destroy]
    end
    resources :comments, only: [:index, :update, :show]
    resources :users, only: [:show, :edit, :update]
    resources :posts, only: [:show, :new, :index, :create, :destroy] do
      resources :comments, only: [:create]
    resources :reviews
    end

    patch '/withdrawal', to: 'customers#withdrawal', as: 'withdrawal'
    
  end  
  
  
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
      sessions: "admin/sessions"
    
  }
  
  namespace :admin do
    root to: "homes#top"
    #get 'admins/:id' => 'admins#show', as: 'admin'
    #patch 'admins/:id' => 'admins#update', as: 'update_admin'
    resources :posts do
      resources :comments, only: [:destroy]
    end
    resources :users, only: [:show, :update, :index,:destroy]
    resources :posts, only: [:show, :update, :index,:destroy]
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
