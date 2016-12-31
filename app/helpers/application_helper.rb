module ApplicationHelper
	def gravatar_for(user,options = {size: 80})
		# 用email抓取gravatar網站的帳號id
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		# 設定圖片SIZE
		size = options[:size]
		# gravatar api網址
		gravatar_url = "http://s.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
		# 抓取圖片, 圖片顯示名稱為username, css class 為 img-circle
		image_tag(gravatar_url, alt: user.username, class: "img-circle")
	end
end
