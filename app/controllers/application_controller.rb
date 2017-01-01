class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # helper_method 一直在背景執行的method
  helper_method :current_user, :logged_in?

  def current_user
  	# ||= 的作用為 如果current_user還未被宣告才執行, 如果已經宣告了, 就不執行, 可防止系統一直到ＤＢ做查詢
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # method + ? 要return boolen
  def logged_in?
  	# !! convert to boolen
  	!!current_user
  end

  def require_user
  	if !logged_in? 
  		flash[:danger] = "You must be logged in to perform that action"
  		redirect_to root_path
  	end
  end
end
