require "test_helper"

class AnnouncementsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get announcements_index_url
    assert_response :success
  end

  test "should get show" do
    get announcements_show_url
    assert_response :success
  end

  test "should get new" do
    get announcements_new_url
    assert_response :success
  end

  test "should get edit" do
    get announcements_edit_url
    assert_response :success
  end

  test "should get create" do
    get announcements_create_url
    assert_response :success
  end

  test "should get update" do
    get announcements_update_url
    assert_response :success
  end

  test "should get destroy" do
    get announcements_destroy_url
    assert_response :success
  end
end
