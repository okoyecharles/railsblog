Rails.application.routes.draw do
  devise_for :users, sign_out_via: %i[get post]
  root to: 'users#index'
  resources :users, only: %i[index show] do
    resources :posts do
      resources :comments
      resources :likes, only: %i[create]
    end
  end

  namespace :api do
    namespace :v1 do
      resources :users, only: %i[index show] do
        resources :posts, only: %i[index create]
      end
    end
  end
end
