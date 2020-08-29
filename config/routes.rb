Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#index'
  resources :books, only: [:index, :create, :edit, :destroy, :update]
  get 'home/about' => 'homes#about'
  resources :users, only: [:index, :show, :edit, :destroy, :update] do
	  resources :post_comments, only: [:create, :destroy]
	  resource :favorites, only: [:create, :destroy]
	  get :search, on: :collection
  end
end
