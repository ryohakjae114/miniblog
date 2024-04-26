Rails.application.routes.draw do
  get 'up' => 'rails/health#show', as: :rails_health_check

  devise_for :users
  root 'posts#index'
  resources :users, only: %i[show update]
  get 'profile/edit'
  resources :posts, only: %i[new create]
end
