Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }
  authenticated :user do
    root :to => 'photos#index', as: :authenticated_root
  end
  get '/profile', to: "home#profile", as: 'user'
  root 'home#landing'
  
  resources :photos do
    resources :comments
    member do
      put "like", to: "photos#upvote"
      put "dislike", to: "photos#downvote"
    end
  end

end
