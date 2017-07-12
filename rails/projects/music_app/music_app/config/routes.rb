Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: redirect("/bands")

  resource :session, only: [:create, :destroy, :new]

  resource :user, only: [:create, :new, :show] do
    get :activate, on: :collection
  end

  resources :bands do
    resources :albums, only: [:new]
  end

  resources :albums, only: [:create, :destroy, :edit, :show, :update] do
    resources :tracks, only: [:new]
  end

  resources :tracks, only: [:create, :destroy, :edit, :show, :update]

  resources :notes, only: [:create, :destroy]
end
