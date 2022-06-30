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
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
