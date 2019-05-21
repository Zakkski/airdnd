Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'

  resources :events do
    collection do
      get 'my_events'
    end
  end

  resources :events, only: [:new, :create, :index, :update, :edit]
  resources :users, only: [:show]
  resources :profiles, only: [:new, :create, :show]

  resources :events, only: [:show] do
    resources :bookings, only: [:create, :update]
  end

  resources :bookings, only: [:show, :index, :destroy]



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
