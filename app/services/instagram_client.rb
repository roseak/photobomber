class InstagramClient
  attr_reader :connection

  def initialize
    @connection = Hurley::Client.new('https://api.instagram.com/v1')
  end

  def get_user_feed(token)
    params = {
      access_token: token
    }

    JSON.parse(connection.get("users/self/feed", params).body, symbolize_names: true)
  end

  def get_specific_user_feed(user_id, token)
    params = {
      access_token: token
    }

    JSON.parse(connection.get("users/#{user_id}/media/recent", params).body, symbolize_names: true)
  end

  def get_trending_feed(token)
    params = {
      access_token: token
    }

    JSON.parse(connection.get("media/popular", params).body, symbolize_names: true)
  end

  def get_tagged(tag_name, token)
    params = {
      q: tag_name,
      access_token: token
    }

    JSON.parse(connection.get("tags/search", params).body, symbolize_names: true)
  end
end
