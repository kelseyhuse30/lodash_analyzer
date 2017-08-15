Rails.application.routes.draw do
  resources :users
  resources :pull_requests
  resources :organizations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :repos
end
