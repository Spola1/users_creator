Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations" }

  namespace :admin do
    resources :users

    root to: "users#index"
  end

  resources :users

  root "users#home"
end
