class TrendingController < ApplicationController
  def index
    @feed = feed
  end

  private

  def feed
    InstagramClient.new.get_trending_feed(current_user.token)
  end
end
