Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  authenticated :user do
    root :to => 'photos#index', as: :authenticated_root
  end
  resource :profile
  resources :users, only: [:show, :update], controller: :profiles
  get '/photos/:photo_id/comments/:id/edit', to: "comments#edit"
  root 'home#landing'
  get '/error' => 'profiles#error'
  resources :photos do
    resources :comments
    member do
      put "like", to: "photos#upvote"
      put "dislike", to: "photos#downvote"
    end
  end

end
