Rails.application.routes.draw do
  devise_for :users
  resources :investments

  get "investments/new" => "investments#new"

  root 'investments#index'
end
