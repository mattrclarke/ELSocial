Rails.application.routes.draw do

  get 'mortality_report/show'
  get 'mortality_report/report'
  resources :mortality_forms
  resources :pens
  resources :leases
  resources :divers

  root "user_sessions#new"
   # root "leases#index"
  resource :user_sessions do
    get :new
    get :success
  end

  resources :users, only: [:new, :create] do
    resources :profile, only: [:show, :index, :edit, :update]
    resources :posts, only: [:create]
    resources :feed, only: [:show]
    member do
      get :following, :followers
    end

  end

  resources :relationships, only: [:create, :destroy]
end
