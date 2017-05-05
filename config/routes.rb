Rails.application.routes.draw do
  get 'posts/index'
  root 'posts#hello'
  resources :posts

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
