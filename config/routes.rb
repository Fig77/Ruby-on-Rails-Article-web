Rails.application.routes.draw do
  devise_for :users
  resources :articles, only:[:new, :create, :show]
  root 'articles#index'
  get 'index', to: 'articles#index'
  put 'articles/:id', to: 'votes#update'
  get 'category/:id', to: 'categories#show', :as => :category
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
