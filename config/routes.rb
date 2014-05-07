Tracker::Application.routes.draw do
  get 'sign_in' => 'sessions#new'
  delete 'sign_out' => 'sessions#destroy'

  resource :sessions, only: :create

  resource :register, only: [ :new, :create ]
  resources :users
  resources :trainees, only: :index

  scope 'utilities' do
    resources :departments, except: [ :show, :edit, :new ]
    resources :job_titles, except: [ :show, :edit, :new ]
    resources :categories, except: [ :show, :edit, :new ]
  end

  namespace :api do
    namespace :v1 do
      resources :trainees, only: [ :create, :update, :destroy ]
      post 'trainees/search' => 'trainees#search'
    end
  end

  root 'home#index'
end
