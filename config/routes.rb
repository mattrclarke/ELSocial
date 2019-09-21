Rails.application.routes.draw do
  root "user_sessions#new"
  resource :user_sessions do
    get :new
    get :success
  end

  resources :users, only: [:new, :create] do
    resources :profile, only: [:show, :index]
    resources :posts, only: [:create]
    resources :feed, only: [:show]
  end

  # resources :profile, only: [:show, :index, :edit, :update] do
  #     resource :posts
  #   end
  # end


end
