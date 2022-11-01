Rails.application.routes.draw do
  devise_for :users
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create] do
      resources :comments, only: %i[new create]
      resources :likes, only: %i[create]
    end
  end

  root to: 'users#index'
end
