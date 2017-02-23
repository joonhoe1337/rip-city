require 'test_helper'

class RoomControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get room_update_url
    assert_response :success
  end

end
