Rails.application.routes.draw do
  
  get 'notifications/index'

  resources :submit_requests do
    get 'inbox', on: :collection
    member do
      patch 'approve'
      patch 'reject'
    end
  end

  resources :tasks
  get 'relationships/create'

  get 'relationships/destroy'

  root 'top#index'


  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :contacts, only: [:new, :create] do
    collection do
      post :confirm
    end
  end


  resources :blogs do
    resources :comments

    collection do
      post :confirm
    end
  end

  resources :poems, only: [:index,:show]

  devise_for :users,controllers:{
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  resources :users, only: [:index,:show]

  resources :relationships, only: [:create, :destroy]

  resources :conversations do
    resources :messages
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
