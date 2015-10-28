class FeedController < ApplicationController
  before_action :authorize!

  def index
    @feed = home_feed
  end

  def show
    @feed = feed(params[:id])
  end

  private

  def authorize!
    redirect_to root_path unless current_user
  end

  def home_feed
    InstagramClient.new.get_user_feed(current_user.token)
  end

  def feed(user_id)
    InstagramClient.new.get_specific_user_feed(user_id, current_user.token)
  end
end
