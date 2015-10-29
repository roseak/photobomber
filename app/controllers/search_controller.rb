class SearchController < ApplicationController
  def index
    @users = users(params[:search])
  end

  private

  def users(name)
    InstagramClient.new(current_user.token).search_name(name)
  end
end
