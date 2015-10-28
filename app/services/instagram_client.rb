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
end
