require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest
  def setup
    @category = Category.create(name: "test1")
    @category2 = Category.create(name: "test2")
end
  
  test "should show categories listing" do
    get categories_path 
    assert_template 'categories/index'
    # 確認是否有以下規則的連結
    assert_select "a[href=?]", category_path(@category), text: @category.name
    assert_select "a[href=?]", category_path(@category2), text: @category2.name
  end
end