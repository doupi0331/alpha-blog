require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
	
	def setup
		@category = Category.create(name: "sports")
		@user = User.create(username: "admin", email: "admin@example.com", password: "password", admin: true)
	end

	test "should get categories index" do
		# 檢查controller是否有index action
		get :index

		# 回傳成功
		assert_response :success
	end

	test "should get new" do
	  # 須登入
	  session[:user_id] = @user.id
		get :new
		assert_response :success
	end

	test "should get show" do
		#get(:show, {'id' => @category.id})
		get :show, id: @category
		assert_response :success
	end	
	
	# 模擬admin未登入並至new page的情況
	test "should redirect create when admin not logged in" do
		# 如使用者在未登入下，要求新增
		# assert_no_difference 資料庫不可有任何更動
		assert_no_difference 'Category.count' do 
			post :create, category: { name: "sports" }
		end
		# 並將頁面導至index path
		assert_redirected_to categories_path
	end

end
