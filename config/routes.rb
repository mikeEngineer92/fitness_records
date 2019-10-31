Rails.application.routes.draw do
  root "home#top"
  get "about", to: "home#about"

  get "records/index", to: "records#index"
  get "records/new", to: "records#new"
  get "records/:id", to: "records#show"
  post "records/create", to: "records#create"
  get "records/:id/edit", to: "records#edit"
  patch "records/:id/update", to: "records#update"
  delete "records/:id/destroy", to: "records#destroy"
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
