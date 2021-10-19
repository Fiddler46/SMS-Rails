Rails.application.routes.draw do
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :teams
      resources :messages
      resources :developers
    end
  end
  
  
  resources :teams
  resources :messages
  resources :developers
  
  post 'trigger_notification' => 'trigger#notification'

end
