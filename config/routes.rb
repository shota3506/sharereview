Rails.application.routes.draw do
  root to: 'conferences#index'

  get '/login' => 'sessions#new', as: :login
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy', as: :logout

  resources :users
  resources :conferences do
    resources :theses do
      resources :comments, only: :create
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
