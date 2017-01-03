require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
	
	def setup
		@category = Category.create(name: "sports")
	end

	test "should get categories index" do
		# 檢查controller是否有index action
		get :index

		# 回傳成功
		assert_response :success
	end

	test "should get new" do
		get :new
		assert_response :success
	end

	test "should get show" do
		#get(:show, {'id' => @category.id})
		get :show, id: @category
		assert_response :success
	end	

end
