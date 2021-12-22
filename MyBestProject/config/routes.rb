Rails.application.routes.draw do
  resources :users do
    resource :profile
    resources :devices, shallow: true

    get :search, on: :collection
    get :preview, on: :member
    patch :change_balance, on: :member
  end

  namespace :admin do
    root 'home#main'
  end

  namespace :api do
    namespace :v1 do
      resources :users
    end
  end

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  # authenticated :user, lambda { |u| u.has_role? :admin } do
  # end

  root 'home#main'
end
