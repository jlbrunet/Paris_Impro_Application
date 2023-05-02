Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "absences/new", to: "absences#new"
  post "absences", to: "absences#create"
  get "rattrapages/new", to: "rattrapages#new"
  post "rattrapages", to: "rattrapages#create"
  get "rattrapages/:id", to: "rattrapages#show"
  resources :courses, only: [:index] do
    resources :lessons, only: [:index]
  end
end
