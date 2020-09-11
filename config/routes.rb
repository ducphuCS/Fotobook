Rails.application.routes.draw do
  devise_for :users

  root to: "users#feed"

  get 'feed', to: "users#feed"
  get 'discover', to: "users#discover"
  get 'toggle_like', to: "users#toggle_like"
  get 'toggle_follow', to: "users#toggle_follow"


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
