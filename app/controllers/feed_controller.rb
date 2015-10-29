class FeedController < ApplicationController
  before_action :authorize!

  def index
    @feed = home_feed
  end

  def show
    @feed = feed(params[:id])
    @user_data = user_data(params[:id])
  end

  private

  def authorize!
    redirect_to root_path unless current_user
  end

  def home_feed
    InstagramClient.new(current_user.token).get_user_feed
  end

  def feed(user_id)
    InstagramClient.new(current_user.token).get_specific_user_feed(user_id)
  end

  def user_data(user_id)
    InstagramClient.new(current_user.token).get_user_data(user_id)
  end
end
