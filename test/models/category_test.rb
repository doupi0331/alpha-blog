require 'test_helper'

# 測試model可允許或不可允許之情況

class CategoryTest < ActiveSupport::TestCase

	# 一開始執行的function
	def setup
		@category = Category.new(name: "sports")
	end

	# 測試情況 test "測試描述"
	test "category should be valid" do
		# assert -> 被允許
		assert @category.valid?
	end

	test "name should be present" do
		@category.name = " "
		# assert_not -> 不被允許
		assert_not @category.valid?
	end

	test "name should be unique" do
		# 在test裡，不會真的存取資料庫，可保持資料正確性
		@category.save
		category2 = Category.new(name: "sports")
		assert_not category2.valid?
	end

	test "name should not be too long" do
		@category.name = "a" * 26
		assert_not @category.valid?
	end

	test "name should not be short" do
		@category.name = "aa"
		assert_not @category.valid?
	end

end