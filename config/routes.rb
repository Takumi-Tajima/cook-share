Rails.application.routes.draw do
  get  '/sign_up', to: 'sign_up#new'
  post '/sign_up', to: 'sign_up#create'

  root 'home#index'

  get 'up' => 'rails/health#show', as: :rails_health_check
end
