require 'test_helper'

class Users::MypageControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get users_mypage_show_url
    assert_response :success
  end

end
