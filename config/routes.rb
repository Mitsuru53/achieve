Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # devise_for :users ここどうすればいい？
  resources :contacts, only: [:new, :create] do
    collection do
      post :confirm
    end
  end


  resources :blogs, only: [:index, :new, :create,:edit,:update,:destroy] do
    collection do
      post :confirm
    end
  end

  root 'top#index'

  resources :poems, only: [:index,:show]

  devise_for :users,controllers:{
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
