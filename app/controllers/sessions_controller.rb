class SessionsController < ApplicationController
  require "net/http"

  def create
    url = URI.parse('https://api.instagram.com/oauth/access_token')
    redirect_url = URI.parse(ENV['CALLBACK'])
    args = {'code' => params[:code],
            'redirect_uri' => redirect_url,
            'client_id' => ENV['INSTAGRAM_ID'],
            'client_secret' => ENV['INSTAGRAM_SECRET'],
            'grant_type' => 'authorization_code'}
    response = Net::HTTP.post_form(url, args)
    if user = User.from_oauth(JSON.parse(response.read_body))
      session[:user_id] = user.id
    end
    redirect_to root_path
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
