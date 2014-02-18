Tracker::Application.routes.draw do
  get 'sign_in' => 'sessions#new'

  resource :sessions, only: :create

  resources :users, only: [ :new, :create ]
  resources :trainees, only: :index

  namespace :api do
    namespace :v1 do
      resources :trainees, only: :index
    end
  end

  root 'home#index'
end
