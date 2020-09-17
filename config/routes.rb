Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root to: "users#feed", as: :root
    end

    unauthenticated do
      root to: "users#guest", as: :root_unauthenticated
    end
  end

  get 'feed', to: "users#feed"
  get 'discover', to: "users#discover"
  get 'toggle_like', to: "users#toggle_like"
  get 'toggle_follow', to: "users#toggle_follow"
  get 'admin', to: "users#admin"
  get 'get_album', to: "users#get_album"


  resources :users, only: :show do
    resources :photos, :albums, only: [:new, :create]
  end

  resources :photos, :albums, only: [:edit, :update, :destroy]

  namespace :admin do
    resources :albums, except: [:new, :create, :show]
    resources :photos, except: [:new, :create, :show]
    resources :users, except: [:new, :create, :show]
  end
end
