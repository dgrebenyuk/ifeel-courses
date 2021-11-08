Rails.application.routes.draw do
  resources :users do
    resource :profile
    resources :devices, shallow: true

    get :search, on: :collection
    get :preview, on: :member
  end

  namespace :admin do
    root 'home#main'
  end

  root 'home#main'
end
