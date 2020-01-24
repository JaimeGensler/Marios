Rails.application.routes.draw do
    root to: 'homes#index'

    #register
    get '/register',  to: 'users#new',         as: 'new_user'
    post '/users',    to: 'users#create'

    #sign in/out
    get '/signin',    to: 'sessions#new',      as: 'new_session'
    post '/signin',   to: 'sessions#create'
    get '/signout',   to: 'sessions#destroy',  as: 'destroy_session'

    resources :products do
        resources :reviews, except: [:index]
    end
end
