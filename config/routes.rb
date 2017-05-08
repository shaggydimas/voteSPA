Rails.application.routes.draw do
  devise_for :users
  root 'votes#index'

  resources :posts do
    resources :comments do
      member do
        put '/upvote' => 'comments#upvote'
      end
    end

    member do
      put '/upvote' => 'posts#upvote'
    end
  end
end
