class OauthService
  attr_reader :connection

  def initialize
    @connection = Hurley::Client.new('https://api.instagram.com/oauth/access_token')
  end

  def get_user_data(code)
    params = {
      code:          code,
      redirect_uri:  ENV['CALLBACK'],
      client_id:     ENV['INSTAGRAM_ID'],
      client_secret: ENV['INSTAGRAM_SECRET'],
      grant_type:    'authorization_code'
    }

    JSON.parse(connection.post("", params).body)
  end
end
