Rails.application.routes.draw do
  resources :carts, only: %i[index create destroy] do
    member do
      post 'increase'
      post 'decrease'
      post 'destroy'
    end
  end
  resources :orders
  resources :items do
    resources :favorites, only: [:create, :destroy]

    collection do
      get 'search'
    end
  end
  resources :categories
  resources :brands
  devise_for :users
  root 'pages#index'
  get '/mypage/order', to: 'orders#mypage'
  get 'mypage/:id/favorite', to: 'mypages#favorite'
  get 'mypage/:id', to: 'mypages#show'
  post '/pages/guest_sign_in', to: 'pages#guest_sign_in'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
