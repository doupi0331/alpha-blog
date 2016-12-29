class User < ActiveRecord::Base
	# 設定關聯 , 一的一方
	has_many :article

	# 儲存前先執行
	before_save { self.email = email.downcase }

	# email驗證格式
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :username, presence: true, 
			  uniqueness: {case_sensitive: false}, 
			  length: {minimum: 3, maximum: 25}
	validates :email, presence: true,
			  uniqueness: {case_sensitive: false},
			  length: {maximum: 105},
			  format: {with: VALID_EMAIL_REGEX}

end