class InstagramClient
  attr_reader :connection, :token

  def initialize(token)
    @connection = Hurley::Client.new('https://api.instagram.com/v1')
    @token = token
  end

  def get_user_feed
    get_json("users/self/feed")
  end

  def get_specific_user_feed(user_id)
    get_json("users/#{user_id}/media/recent")
  end

  def get_user_data(user_id)
    get_json("users/#{user_id}")
  end

  def get_trending_feed
    get_json("media/popular")
  end

  def search_name(name)
    get_json("users/search", { q: name })
  end

  def params
    { access_token: token }
  end

  def get_json(url, optional_params = {})
    JSON.parse(connection.get(url, params.merge(optional_params)).body, symbolize_names: true)
  end
end
