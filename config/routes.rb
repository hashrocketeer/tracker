Tracker::Application.routes.draw do
  get 'sign_in' => 'sessions#new'
  delete 'sign_out' => 'sessions#destroy'

  resource :sessions, only: :create

  resource :register, only: [ :new, :create ]
  resources :users
  resources :trainees, only: :index

  namespace :api do
    namespace :v1 do
      resources :trainees, only: :index
    end
  end

  root 'home#index'
end
