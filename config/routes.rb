Rails.application.routes.draw do
  get 'account/show'
  get 'dashboard/index'
  post 'dashboard/search'
  resources :contacts
  devise_for :users
  authenticated :user do
    root to: "dashboard#index", as: :authenticated_root
  end

  devise_scope :user do
    root to: 'devise/sessions#new'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Almost every application defines a route for the root path ("/") at the top of this file.
  # root "articles#index"
end
