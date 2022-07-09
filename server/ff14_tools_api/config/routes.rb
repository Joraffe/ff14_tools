Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :gears
      resources :gear_slots
      resources :gear_sets
      resources :characters
      resources :boss_loots
      resources :loots
      resources :bosses
      resources :raids
      resources :jobs
      resources :roles
      resources :statics
    end
  end

  root to: "home#index"

  post "refresh", controller: :refresh, action: :create
  post "signin", controller: :signin, action: :create
  post "signup", controller: :signup, action: :create
  delete "signin", controller: :signin, action: :destroy

end
