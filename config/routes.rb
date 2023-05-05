Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "absences/new", to: "absences#new"
  post "absences", to: "absences#create"
  get "rattrapages/new", to: "rattrapages#new"
  post "rattrapages", to: "rattrapages#create"
  get "rattrapages/validation", to: "rattrapages#validation", as: :rattrapage_validation
  post "rattrapages", to: "rattrapages#creation", as: :rattrapage_creation
  get "rattrapages/:id", to: "rattrapages#show", as: :rattrapage_show
  get "pages/myaccount", to: "pages#myaccount"
  resources :courses, only: [:index] do
    resources :lessons, only: [:index]
  end
end
