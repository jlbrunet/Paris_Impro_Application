Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "absences/new", to: "absences#new"
  post "absences", to: "absences#create"
  get "lessons/new", to: "lessons#new"
  post "lessons", to: "lessons#create"
  get "rattrapages/new", to: "rattrapages#new"
  post "rattrapages", to: "rattrapages#create"
  get "rattrapages/:id", to: "rattrapages#show", as: :rattrapage_show
  get "pages/myaccount", to: "pages#myaccount"
  resources :courses, only: %i[index show] do
    resources :lessons, only: [:index]
    post "lessons", to: "lessons#create_place", as: :create_place
  end
  get '/users', to: redirect('/users/sign_up')
  patch "profiles/:id", to: "profiles#update", as: :profile_update
  delete "absences/:id", to: "absences#destroy", as: :absence_destroy
  delete "rattrapages/:id", to: "rattrapages#destroy", as: :rattrapage_destroy
end
