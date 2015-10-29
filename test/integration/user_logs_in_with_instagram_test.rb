require "test_helper"

class UserLogsInWithInstagramTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  def setup
    Capybara.app = Photobomber::Application
  end

  test "logging in" do
    visit "/"
    assert_equal 200, page.status_code
    assert page.has_content?("LOGIN")
  end
end
