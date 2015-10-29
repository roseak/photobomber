require 'test_helper'

class TrendingControllerTest < ActionController::TestCase
  test "stubs request using VCR for trending feed" do
    user = User.create(uid: "31027128",
                      name: "Rosie Kohn",
                      nickname: "rosieisupposie",
                      image: "https://scontent.cdninstagram.com/hphotos-xaf1/t51.2885-19/11375311_129968644011289_1395263579_a.jpg",
                      bio: "300 headstands to go.",
                      website: "",
                      token: ENV["SAMPLE_USER_TOKEN"])
    session[:user_id] = user.id

    VCR.use_cassette("_trending_data") do
      get :index
      assert_response 200
      assert_match /Thanks for the 6k/, response.body
      assert_match /billionladies/, response.body
    end
  end
end
