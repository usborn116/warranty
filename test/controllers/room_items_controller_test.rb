require "test_helper"

class RoomItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get room_items_new_url
    assert_response :success
  end

  test "should get create" do
    get room_items_create_url
    assert_response :success
  end

  test "should get edit" do
    get room_items_edit_url
    assert_response :success
  end

  test "should get update" do
    get room_items_update_url
    assert_response :success
  end

  test "should get destory" do
    get room_items_destory_url
    assert_response :success
  end
end
