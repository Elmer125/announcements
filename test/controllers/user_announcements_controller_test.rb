require "test_helper"

class UserAnnouncementsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get user_announcements_update_url
    assert_response :success
  end
end
