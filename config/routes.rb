Rails.application.routes.draw do
    root to: 'homes#index'
    resources :products do
        resources :reviews, except: [:destroy]
    end
end
