Rails.application.routes.draw do
  resources :carts, only: %i[index create destroy] do
    member do
      post 'increase'
      post 'decrease'
      post 'destroy'
    end
  end
  resources :items
  resources :categories
  resources :brands
  devise_for :users
  root 'pages#index'
  get 'mypage/:id', to: 'mypages#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
