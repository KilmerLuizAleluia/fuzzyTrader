Rails.application.routes.draw do
  resources :investments, only: [:buy, :index, :new] do
    collection do
      post :buy, to: 'investments#buy'
    end
  end

  devise_for :users
  resources :portfolios

  root 'investments#index'
end
