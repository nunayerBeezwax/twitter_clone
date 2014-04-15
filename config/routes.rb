TwitterClone::Application.routes.draw do
  root to: 'home#index'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users do
    resources :tweets
    resources :followings
  end
  resources :sessions
  resources :tweets
  resources :followings
end
