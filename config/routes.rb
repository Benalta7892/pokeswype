Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  devise_for :users
  root to: "pages#home"
  get "dashboard", to: "pages#dashboard"

  resources :cards, only: [:index, :show, :new, :create] do
    resources :exchanges, only: [:new, :create]
    collection do
      get "search"
    end
  end

  resources :exchanges, only: [:index, :show]
    resources :reviews, only: [:new, :create]
  end

  resources :users, only: [:show, :edit, :update] do
    resources :cards, only: [:index]
    resources :user_cards, only: [:index]
  end
end
