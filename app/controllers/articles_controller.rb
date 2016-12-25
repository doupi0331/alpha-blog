class ArticlesController < ApplicationController
	
	def index
		@articles = Article.all
	end

	def new
		@article = Article.new
	end

	# new 頁面裡的 submit
	def create
		# 顯示物件
		# render plain: params[:article].inspect

		@article = Article.new(article_params)
		if @article.save
			# 顯示訊息
			flash[:notice] = "Article was successfully created"

			# 導入show頁面 
			# article GET    /articles/:id(.:format)      articles#show
			redirect_to article_path(@article)
		else
			# 存取失敗，重新load new 頁面
			render 'new'
		end
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		 @article = Article.find(params[:id])
		 if @article.update(article_params) 
		 	flash[:notice] = "Article was successfully updated"
		 	redirect_to article_path(@article)
		 else
		 	render 'edit'
		 end
	end

	def show
		@article = Article.find(params[:id])
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to articles_path
	end

	private def article_params
		params.require(:article).permit(:title, :description)
	end
end
