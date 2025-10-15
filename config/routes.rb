Rails.application.routes.draw do
  get  '/sign_up', to: 'sign_up#new'
  post '/sign_up', to: 'sign_up#create'
  get  '/sign_in', to: 'session#new'
  post '/sign_in', to: 'session#create'
  delete '/sign_out', to: 'session#destroy'

  root 'home#index'

  namespace :users do
    resource :introduction, only: %i[show edit update]
    resource :authentication, only: %i[edit update]
  end

  get 'up' => 'rails/health#show', as: :rails_health_check
end
