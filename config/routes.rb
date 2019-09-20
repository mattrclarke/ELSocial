Rails.application.routes.draw do
  root "user_sessions#new"
  resources :users, only: [:new, :create]
  resource :user_sessions do
    get :new
    get :success
  end
  resources :profile, only: [:show, :index, :edit, :update] do
    resources :feed, only: [:show] do
      resource :posts
    end
  end

end
