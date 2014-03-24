Tracker::Application.routes.draw do
  get 'sign_in' => 'sessions#new'
  delete 'sign_out' => 'sessions#destroy'

  resource :sessions, only: :create

  resource :register, only: [ :new, :create ]
  resources :users
  resources :trainees, only: :index

  scope 'utilities' do
    resources :departments, only: [ :index, :create, :update ]
    resources :job_titles, only: [ :index, :create, :update ]
    resources :categories
  end

  namespace :api do
    namespace :v1 do
      resources :trainees, only: :index
    end
  end

  root 'home#index'
end
