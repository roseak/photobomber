Rails.application.routes.draw do
  get 'tagged/index'

  get 'trending/index'
  root 'welcome#index'
  get '/auth/instagram', as: :login
  get '/auth/instagram/callback', to: 'sessions#create'
  delete '/logout', as: :logout, to: 'sessions#destroy'
  resources :feed, only: [:index, :show]
end
