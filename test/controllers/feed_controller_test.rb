require 'test_helper'

class FeedControllerTest < ActionController::TestCase
  test "stubs request using VCR for home feed" do
    user = User.create(uid: "31027128",
                      name: "Rosie Kohn",
                      nickname: "rosieisupposie",
                      image: "https://scontent.cdninstagram.com/hphotos-xaf1/t51.2885-19/11375311_129968644011289_1395263579_a.jpg",
                      bio: "300 headstands to go.",
                      website: "",
                      token: ENV["SAMPLE_USER_TOKEN"])
    session[:user_id] = user.id

    VCR.use_cassette("_rosiekohn_data") do
      get :index
      assert_response 200
      assert_match /Look at that dapper dude shake it!/, response.body
      assert_match /deebro_/, response.body
    end
  end

  test "stubs request using VCR for user feed" do
    user = User.create(uid: "31027128",
                      name: "Rosie Kohn",
                      nickname: "rosieisupposie",
                      image: "https://scontent.cdninstagram.com/hphotos-xaf1/t51.2885-19/11375311_129968644011289_1395263579_a.jpg",
                      bio: "300 headstands to go.",
                      website: "",
                      token: ENV["SAMPLE_USER_TOKEN"])
    session[:user_id] = user.id

    VCR.use_cassette("_anniebuckmaster_user_data") do
      get :show, id: "29859906"
      assert_response 200
      assert_match /annie mancini/, response.body
      assert_match /454/, response.body
    end
  end
end
