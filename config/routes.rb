Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "movies#index"

  resources :movies do
    resources :reviews
    resources :favorites, only: [:create, :destroy]
  end

  get "movies/filter/:filter", to: "movies#index", as: :filtered_movies

  resources :users
  get 'signup', to: 'users#new'

  resource :session, only: [:new, :create, :destroy]
  get 'signin', to: 'sessions#new'

  resources :genres
end
