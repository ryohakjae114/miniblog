Rails.application.routes.draw do
  get 'up' => 'rails/health#show', as: :rails_health_check

  devise_for :users
  root 'posts#index'
  resources :users, only: :show
  resource :profile, only: %i[edit update]
  resources :posts, only: %i[new create show], shallow: true do
    resources :likes, only: %i[index create destroy], module: 'posts'
    resources :comments, only: %i[new create], module: 'posts'
  end
  namespace :following do
    resources :posts, only: %i[index]
  end
  resources :relationships, only: %i[create destroy]
end
