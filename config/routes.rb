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
    resources :reviews, except: [:create, :new]
    resources :categories, only: [:index, :create, :edit, :update, :destroy]
    resources :users, only: [:index, :show, :edit, :update]
    resources :review_comments, only: [:destroy]
  end



  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions',
    passwords: 'users/passwords'
  }

  scope module: :public do
    root 'homes#top'
    get '/about' => 'homes#about'
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
