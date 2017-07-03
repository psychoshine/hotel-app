Rails.application.routes.draw do

scope '(:locale)', locale: /ua|ru/ do
    resources :contact_us
    resources :contacts, only: [:new, :create, :edit, :update, :index, :destroy]  
    root :to => 'main_shots#index'

    get 'password_resets/new'

    get 'password_resets/edit'

    get 'sessions/new'
    get    '/login',   to: 'sessions#new'
    post   '/login',   to: 'sessions#create'
    delete '/logout',  to: 'sessions#destroy'
    resources :account_activations, only: [:edit]
    resources :password_resets,     only: [:new, :create, :edit, :update]


    get  '/signup',  to: 'users#new'
    post '/signup',  to: 'users#create'  
    resources :users
    resources :reservations, only: [:index, :edit, :update, :show, :destroy]
    resources :entertainments
    resources :main_shots
    resources :booking_posts do
      resources :booking_pictures
      resources :reservations, only: [:new, :create]
    end

    resources :albums do
    	resources :images
    end
    resources :post_slides
    resources :posts

    patch 'posts/:id', controller: 'posts', action: :update

    match '/test',                    to: 'static_pages#test',                  via: 'get'
    match '/test2',                    to: 'static_pages#test2',                  via: 'get'
    match '/paralax',                    to: 'static_pages#paralax',                  via: 'get'
end
end
