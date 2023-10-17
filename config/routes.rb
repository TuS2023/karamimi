Rails.application.routes.draw do


  namespace :admin do
    get 'categories/index'
    get 'categories/edit'
  end
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    get 'top' => 'homes#top', as: 'top'
    resources :users, only: [:index, :show, :edit, :update]
    resources :reviews, only: [:index, :show, :edit, :update, :destroy] do
      resources :review_comments, only: [:destroy]
    end
    resources :categories, only: [:index, :create, :edit, :update, :destroy]

  end



  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions',
    passwords: 'users/passwords'
  }

  scope module: :public do
    root 'homes#top'
    get '/about' => 'homes#about'
    get 'search' => 'reviews#search'
    resources :reviews do
      resource :favorites, only: [:create, :destroy]
      resources :review_comments, only: [:create, :destroy]
    end
    resources :users, only: [:show, :edit, :update] do
      collection do
        get 'check'
        patch 'leave'
      end
    end

  end
  #ゲストユーザー用
  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end


end
