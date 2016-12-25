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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
