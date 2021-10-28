Rails.application.routes.draw do
  # Account
  get 'account/show'
  match 'account/quit/group/:id' => 'account#quit', :via => :delete, :as => 'quit_group'

  # Dashboard
  get 'dashboard/index'
  post 'dashboard/search'

  # Contacts
  resources :contacts

  # Notifications
  get 'notifications/index'
  match 'notifications/:id' => 'notifications#seen', :via => :post, :as => 'seen_notification'
  # Courses
  resources :courses

  # Groups
  get 'groups/join'
  post 'groups/add'
  match "/groups/call/:id" => "groups#call", :via => [:get, :post], :as => 'call_user'
  post 'groups/invit'
  resources :groups

  # Devise
  devise_for :users
  authenticated :user do
    root to: "courses#index", as: :authenticated_root
  end

  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Almost every application defines a route for the root path ("/") at the top of this file.
  # root "articles#index"
end
