Rails.application.routes.draw do
	#get "pages/home" => "pages#home"
	get "about" => "pages#about"
	root "pages#home"

	# 會產生所有articles Table所需的path
	# articles GET    /articles(.:format)          articles#index
  #          POST   /articles(.:format)          articles#create
  # new_article GET    /articles/new(.:format)      articles#new
	# edit_article GET    /articles/:id/edit(.:format) articles#edit
  # article GET    /articles/:id(.:format)      articles#show
  #         PATCH  /articles/:id(.:format)      articles#update
  #         PUT    /articles/:id(.:format)      articles#update
  #         DELETE /articles/:id(.:format)      articles#destroy
	resources :articles

	# signup GET    /signup(.:format)            users#new
  # users GET    /users(.:format)             users#index
  #       POST   /users(.:format)             users#create
  # edit_user GET    /users/:id/edit(.:format)    users#edit
  # user GET    /users/:id(.:format)         users#show
  #      PATCH  /users/:id(.:format)         users#update
  #      PUT    /users/:id(.:format)         users#update
  #      DELETE /users/:id(.:format)         users#destroy
	get "signup" => "users#new"
	resources :users, except: [:new]

	get "login" => "sessions#new"
	post "login" => "sessions#create"
	delete "logout" => "sessions#destroy"
	
  # categories GET    /categories(.:format)          categories#index
  #            POST   /categories(.:format)          categories#create
  # new_category GET    /categories/new(.:format)      categories#new
  # edit_category GET    /categories/:id/edit(.:format) categories#edit
  # category GET    /categories/:id(.:format)      categories#show
  #          PATCH  /categories/:id(.:format)      categories#update
  #          PUT    /categories/:id(.:format)      categories#update
  resources :categories, except: [:destroy]
end
