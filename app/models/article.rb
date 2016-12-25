class Article < ActiveRecord::Base
	# 設定條件
	# presence -> 是否必填
	# length -> 長度限制
	validates :title, presence: true, length: { minimum: 3, maximum: 50 }
	validates :description, presence: true, length: { minimum: 10, maximum: 300 }


end