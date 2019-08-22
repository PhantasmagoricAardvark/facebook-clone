Rails.application.routes.draw do
  get 'comments/create'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
  	root "devise/sessions#new"
  end

  resources :friend_requests,	only: [:create, :destroy, :update]
  resources :friendships, 		only: [:create, :destroy]
  resources :users, 					only: [:index,:show]
  resources :posts,           only: [:index, :show, :new, :create]
  resources :likes,           only: [:create, :destroy]
  resources :comments,        only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
