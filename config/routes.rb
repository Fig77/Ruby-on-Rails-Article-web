Rails.application.routes.draw do
  devise_for :users
  root 'articles#index'
  get 'articles/index'
  get 'articles/create'
  get 'articles/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
