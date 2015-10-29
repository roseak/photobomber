class TrendingController < ApplicationController
  def index
    @feed = feed
  end

  private

  def feed
    InstagramClient.new(current_user.token).get_trending_feed
  end
end
