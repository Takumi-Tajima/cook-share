Rails.application.routes.draw do
  get  '/sign_up', to: 'sign_up#new'
  post '/sign_up', to: 'sign_up#create'
  get  '/sign_in', to: 'session#new'
  post '/sign_in', to: 'session#create'
  delete '/sign_out', to: 'session#destroy'

  root 'home#index'

  get 'up' => 'rails/health#show', as: :rails_health_check
end
