class FeedController < ApplicationController
  before_action :authorize!

  def index
    @feed = home_feed
  end

  def show
    @feed = feed(params[:id])
    # @feed = InstagramPost.feed(current_user.token, params[:id])
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
end

# class InstagramPost

#  def self.feed(token, user_id)
#    feed_items = InstagramClient.new(token).get_specific_user_feed(user_id)
#    feed_items.map { |feed_item|
#      OpenStruct.new(location: feed_item[:data][:location])
#    }
#  end
# end
