Rails.application.routes.draw do
  resources :gamelists
  resources :comments
  devise_for :users
  resources :games do
    resources :comments, except: [:show, :index]
  end

  root 'games#index'
end
