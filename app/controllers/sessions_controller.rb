class SessionsController < ApplicationController
  def create
    user_data = OauthService.new.get_user_data(params[:code])

    if user = User.from_oauth(user_data)
      session[:user_id] = user.id
      redirect_to feed_path
    else
      redirect_to root_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
