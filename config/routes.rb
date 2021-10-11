Rails.application.routes.draw do
  resources :teams
  resources :messages
  resources :developers
  
  post 'trigger_notification' => 'trigger#notification'

end
