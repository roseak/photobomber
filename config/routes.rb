Rails.application.routes.draw do
  get 'trending/index'
  root 'welcome#index'
  get '/auth/instagram', as: :login
  get '/auth/instagram/callback', to: 'sessions#create'
  delete '/logout', as: :logout, to: 'sessions#destroy'
  resources :feed, only: [:index, :show]
  get '/users/search', as: :search, to: 'search#index'
end
