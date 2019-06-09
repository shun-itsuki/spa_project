require 'test_helper'

class Users::ExplanationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_explanation_index_url
    assert_response :success
  end

end
