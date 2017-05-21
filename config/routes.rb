Rails.application.routes.draw do
  devise_for :users
  resources :votes
  root 'votes#index'
  post '/vote/:id', to:'votes#add_vote'
end
