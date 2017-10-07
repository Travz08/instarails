Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  authenticated :user do
    root :to => 'photos#index', as: :authenticated_root
  end
  get '/profile', to: "home#profile", as: 'user'
  root 'home#landing'
  post '/' => 'photos#index'
  # match "/photos/comment" => "photos#comment", :as => "add_new_comment_to_photos", :via => [:post]
  resources :photos do
    resources :comments
    member do
      put "like", to: "photos#upvote"
      put "dislike", to: "photos#downvote"
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
