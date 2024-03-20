Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  devise_for :users
  root to: "pages#home"

  # Routes pour Dashboard avec onglets
  get "dashboard", to: "pages#dashboard"

  resources :dashboards, only: [] do
    collection do
      get "last_captured"
      get "collection"
      get "favorites"
      get "wish_list"
      get "exchangeable_cards"
      get "current_exchanges"
    end
  end

  resources :cards, only: [:index, :show, :new, :create] do
    resources :card_wishes, only: [:create]
    resources :card_interests, only: [:new, :create]
    collection do
      get "search"
    end
    member do
      get :collectors
    end
  end

  resources :exchanges, only: [:index, :show] do
    resources :chatrooms, only: [:create]
    resources :reviews, only: [:new, :create]
  end

  resources :users, only: [:show, :edit, :update] do
    resources :user_cards, only: [:index, :create, :update, :destroy]
    resources :exchanges, only: [:new, :create, :update]
    resources :card_interests, only: [:create]
    member do
      get "collection"
    end
  end

  resources :chatrooms, only: [:show] do
    resources :messages, only: [:create]
  end
end
