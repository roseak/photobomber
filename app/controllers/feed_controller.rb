class FeedController < ApplicationController
  before_action :authorize!

  def index
    @feed = InstagramClient.new.get_user_feed(current_user.token)
  end

  private

  def authorize!
    redirect_to root_path unless current_user
  end
end
