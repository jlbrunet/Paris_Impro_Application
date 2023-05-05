Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "lessons/new", to: "lessons#new"
  post "lessons", to: "lessons#create"
  get "rattrapages/new", to: "rattrapages#new"
  post "rattrapages", to: "rattrapages#create"
  get "rattrapages/:id", to: "rattrapages#show"
  get "pages/myaccount", to: "pages#myaccount"
  resources :courses, only: [:index] do
    resources :lessons, only: [:index]
  end
end
