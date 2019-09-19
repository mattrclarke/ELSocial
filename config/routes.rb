Rails.application.routes.draw do
  root "user_sessions#new"
  resources :users, only: [:new, :create]
  resource :user_sessions do
    get :new
    get :success
  end
  resources :profile, only: [:show, :edit, :update] do
    resource :feed, only: [:show]
  end
end
