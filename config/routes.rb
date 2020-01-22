Rails.application.routes.draw do
  root "pins#index"
  get '/pins/new', to: 'pins#new', as: 'new_pin'
  post '/pins', to: 'pins#create'
  get '/pins/:id', to: 'pins#show', as: 'pin'
  get '/pins/:id/edit', to: 'pins#edit', as: 'edit_pin'
  delete '/pins/:id', to: 'pins#destroy'
  #resources :pins
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
