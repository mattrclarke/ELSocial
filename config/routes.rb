Rails.application.routes.draw do
  root "user_sessions#new"
  resource :user_sessions do
    get :new
    get :success
  end

  resources :users, only: [:new, :create] do
    resources :profile, only: [:show, :index, :edit, :update]
    resources :posts, only: [:create]
    resources :feed, only: [:show]

    # collection do
    #     get :profiles
    #   end

    member do
      get :following, :followers
    end

  end

  resources :relationships, only: [:create, :destroy]
end
