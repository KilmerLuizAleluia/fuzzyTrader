Rails.application.routes.draw do
  devise_for :users
  resources :portfolios
  resources :investments, only: %i[buy index new] do
    collection do
      post :buy, to: 'investments#buy'
    end
  end
  root 'investments#index'
end
