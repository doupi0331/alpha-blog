class Article < ActiveRecord::Base
	# 設定關聯 , 多的一方
	belongs_to :user
	
	# 設定多對多關聯
	has_many :article_categories
	has_many :categories, through: :article_categories

	# 設定條件
	# presence -> 是否必填
	# length -> 長度限制
	validates :title, presence: true, length: { minimum: 3, maximum: 50 }
	validates :description, presence: true, length: { minimum: 10, maximum: 300 }
	validates :user_id, presence: true

end