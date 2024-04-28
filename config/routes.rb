Rails.application.routes.draw do
  resources :brands
  devise_for :users
  root 'pages#index'
  get 'mypage/:id', to: 'mypages#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
