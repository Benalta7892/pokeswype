Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  devise_for :users
  root to: "pages#home"

  get "cards/search", to: "cards#search"
  get "up" => "rails/health#show", as: :rails_health_check
  get "dashboard", to: "pages#dashboard"

end
