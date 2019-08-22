require 'test_helper'

class FriendRequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get friend_requests_create_url
    assert_response :success
  end

end
