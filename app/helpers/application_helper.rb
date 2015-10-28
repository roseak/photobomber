module ApplicationHelper
  def instagram_login_path
    "https://api.instagram.com/oauth/authorize/?client_id=#{ENV['INSTAGRAM_ID']}&redirect_uri=#{ENV['CALLBACK']}&response_type=code"
  end
end
