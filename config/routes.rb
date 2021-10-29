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

  # Invitations
  match 'invitations/accept/:id' => 'invitations#accept', :via => :post, :as => 'accept_invitation'
  match 'invitations/refuse/:id' => 'invitations#refuse', :via => :post, :as => 'refuse_invitation'

  # Courses
  resources :courses

  # Groups
  get 'groups/join'
  post 'groups/add'
  match "/groups/call/:id" => "groups#call", :via => [:get, :post], :as => 'call_user'
  post 'groups/invit'
  resources :groups do
    resources :tasks
    match "/groups/tasks/complete/:id" => "tasks#complete", :via => [:get], :as => 'complete_task'
  end

  # Forum
  resources :channels do
  resources :messages
  end

  # Devise
  devise_for :users
  authenticated :user do
    root to: "groups#index", as: :authenticated_root
  end

  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Almost every application defines a route for the root path ("/") at the top of this file.
  # root "articles#index"
end
