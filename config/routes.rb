Rails.application.routes.draw do
  get 'up' => 'rails/health#show', as: :rails_health_check

  devise_for :users
  root 'posts#index'
  resources :users, only: :show
  resource :profile, only: %i[edit update]
  resources :posts, only: %i[new create]
end
