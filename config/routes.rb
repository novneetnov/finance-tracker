Rails.application.routes.draw do

  devise_for :users, controllers: {registrations: "user/registrations"}
  resources :user_stocks, except: [:show, :edit, :update]  # why index action is not excluded?
	resources :users, only: [:show]
	resources :friendships, only: [:create, :destroy]
	root 'welcome#index'
	get 'my_portfolio', to: 'users#my_portfolio'
	get 'search_stocks', to: 'stocks#search'
	get 'my_friends', to: 'users#my_friends'
	get 'search_friends', to: 'users#search'
	post 'add_friend', to: 'users#add_friend' 

end
