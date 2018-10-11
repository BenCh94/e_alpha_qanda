Rails.application.routes.draw do
  get 'sessions/new'

  resources :answers
  resources :questions
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#hello'
  get  '/signup', to: 'users#new'
  get  '/login',  to: 'sessions#new'
  get  '/logout',  to: 'sessions#destroy'
  post  '/login',  to: 'sessions#create'
end
