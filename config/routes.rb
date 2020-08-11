Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'books#search'
  resources :books, only: [:show, :create]
  resources :cathcopies, only: [:index, :new, :create]
end
