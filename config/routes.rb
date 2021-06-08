Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get'/home/about', to: 'homes#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :users, only: [:show, :edit, :index, :update]
  resources :books, only: [:create, :index, :show, :edit, :destroy, :update] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
    
  end
end
