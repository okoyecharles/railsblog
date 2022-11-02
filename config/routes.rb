Rails.application.routes.draw do
  devise_for :users, sign_out_via: [:get, :post]
  root to: 'users#index'
  resources :users, only: %i[index show] do
    resources :posts do
      resources :comments, only: %i[new create]
      resources :likes, only: %i[create]
    end
  end
end
