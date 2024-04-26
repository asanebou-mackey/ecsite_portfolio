Rails.application.routes.draw do
  get 'brands/index'
  get 'brands/new', to: 'brands#new'
  post 'brands', to: 'brands#create'
  devise_for :users
  root 'pages#index'
  get 'mypage/:id', to: 'mypages#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
