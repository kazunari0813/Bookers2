Rails.application.routes.draw do
   devise_for :users
   get '/home/about' => 'homes#about'
  root 'homes#top'
  resources :users, only: [:show, :edit, :update, :index] do
  end

  resources :books do
  resources :book_comments, only: [:create, :destroy]
  resource :favorites, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end