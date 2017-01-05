class Category < ActiveRecord::Base
  # 設定多對多關聯
  has_many :article_categories
  has_many :articles, through: :article_categories
  
	validates :name, presence: true, 
			  uniqueness: {case_sencetive: false}, 
			  length: { minimum: 3, maximum: 25}
end