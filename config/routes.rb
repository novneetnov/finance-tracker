Rails.application.routes.draw do

  devise_for :users, controllers: {registrations: "user/registrations"}
  resources :user_stocks, except: [:show, :edit, :update]  # why index action is not excluded?
	root 'welcome#index'
	get 'my_portfolio', to: 'users#my_portfolio'
	get 'search_stocks', to: 'stocks#search'

end
