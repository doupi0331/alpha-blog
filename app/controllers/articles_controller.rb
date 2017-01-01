class ArticlesController < ApplicationController
	
	#執行Action前先執行此method
	before_action :set_article, only: [:edit, :update, :show, :destroy]
	before_action :require_user, except: [:index, :show] # 檢查有無登入
	before_action :require_same_user, only: [:edit, :update, :destroy] # 檢查是否為建立者

	def index
		#@articles = Article.all
		# 換頁
		@articles = Article.paginate(page: params[:page], per_page: 5)

	end

	def new
		@article = Article.new
	end

	# new 頁面裡的 submit
	def create
		# 顯示物件
		# render plain: params[:article].inspect

		@article = Article.new(article_params)
		@article.user = User.first # 暫定
		if @article.save
			# 顯示訊息
			flash[:success] = "Article was successfully created"

			# 導入show頁面 
			# article GET    /articles/:id(.:format)      articles#show
			redirect_to article_path(@article)
		else
			# 存取失敗，重新load new 頁面
			render 'new'
		end
	end

	def edit

	end

	def update

		 if @article.update(article_params) 
		 	flash[:success] = "Article was successfully updated"
		 	redirect_to article_path(@article)
		 else
		 	render 'edit'
		 end
	end

	def show

	end

	def destroy
		@article.destroy
		flash[:danger] = "Article was successfully deleted"
		redirect_to articles_path
	end

	private 
		def set_article
			@article = Article.find(params[:id])
		end
		def article_params
			params.require(:article).permit(:title, :description)
		end
		def require_same_user
			if current_user != @article.user
				flash[:danger] = "You can only edit or delete your own articles"
				redirect_to root_path
			end
		end
end

