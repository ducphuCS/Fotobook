Rails.application.routes.draw do
  devise_for :users

  root to: "users#discover"
  get 'newest', to: "home#newest"
  # get '/discover', to: "home#discover"
  get '/login', to: "home#login"
  resources :users, except: [:index, :destroy] do
    member do
      get 'feed', to: "users#feed"
      get 'discover', to: "users#discover"
    end
    resources :photos, shallow: true, except: :show
    resources :albums, shallow: true
  end
  namespace :admin do
    resources :albums, except: [:new, :create, :show]
    resources :photos, except: [:new, :create, :show]
    resources :users, except: [:new, :create, :show]
  end
end
