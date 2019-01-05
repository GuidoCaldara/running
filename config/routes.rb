Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root "races#index"
  resources :races do
    resources :reviews
    resources :photos
    resources :questions
  end
    resources :question do
      resources :answers
    end

    delete "photos/:id", to:"photos#destroy", as: "photo"
    get "complete_profile", to: "users#complete_profile", as: "complete_user_profile"
    patch "save_user_profile", to: "users#save_user_profile", as: "save_user_profile"
    get "dashboard", to: "users#user_dashboard", as: "user_dashboard"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
