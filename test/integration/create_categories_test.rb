require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(username: "admin", email: "admin@example.com", password: "password", admin: true)
  end

  # 模擬新增過程，符合此過程才是正確的
	test "get new category form and create category" do
	  #log in, sign_in_as在test_helper.rb
	  sign_in_as(@user, "password")
	  # 確認是否有route
		get new_category_path
		# 連結至categories/new page
		assert_template 'categories/new'
		# 新增後須比未新增前多一筆資料
		assert_difference 'Category.count', 1 do
		  # POST   /categories(.:format)          categories#create 
		  # 新增
			post_via_redirect categories_path, category: {name: "sports"}
		end
		# 新增完後連結至categories/index path
		assert_template 'categories/index'
		# 並檢查是否有剛剛新增的資料
		assert_match "sports", response.body
	end
	
	# 模擬新增失敗流程
	test "invalid category submission results in failure" do
	  sign_in_as(@user, "password")
		# 確認是否有route
    get new_category_path
    # 連結至categories/new page
    assert_template 'categories/new'
    # 新增失敗資料庫應不變
    assert_no_difference 'Category.count' do
      # POST   /categories(.:format)          categories#create 
      # 新增
      post categories_path, category: {name: " "}
    end
    # 失敗後reflash new page
    assert_template 'categories/new'
    # 並檢查error訊息是否出現, 參考view/shared/_error
    assert_select "h2.panel-title"
    assert_select "div.panel-body"
	end
end