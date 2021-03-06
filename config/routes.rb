Rails.application.routes.draw do

  resources :user_playlists
  resources :playlists
  namespace :api do
    namespace :v1 do
      get 'auth', to: "sessions#create"
      post 'login', to: "users#create"
    end
  end
end
