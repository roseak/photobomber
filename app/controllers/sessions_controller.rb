class SessionsController < ApplicationController
  require "net/http"

  def create
    url = URI.parse('https://api.instagram.com/oauth/access_token')
    redirect_url = URI.parse('http://localhost:3000/auth/instagram/callback')
    args = {'code' => params[:code], 'redirect_uri' => redirect_url, 'client_id' => '5972080647444eaea4c2770a5d04843c', 'client_secret' => 'd0c5e644917441ccb544ac855145a741', 'grant_type' => 'authorization_code'}
    response = Net::HTTP.post_form(url, args)
    user = User.from_oauth(JSON.parse(response.read_body))
    session[:user_id] = user.id
    redirect_to root_path
  end
end
