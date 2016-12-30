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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
