Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: :registrations}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  resources :registrations, only: [:create] do
    match :verify, on: :collection, via: [:get, :post]
  end
end
