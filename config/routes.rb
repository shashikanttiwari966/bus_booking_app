Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "dashboard#index"
  resources :buses do
    resources :bus_services
    resources :drivers
  end
  resources :booking_seats do
    collection do
      get :sucess
      get :cancel
    end
  end
  get 'seats/show'
  patch 'seats/:id', to:"seats#update", as:"seat"
  get 'seats/:id/edit', to:"seats#edit", as:"edit_seats"
end
