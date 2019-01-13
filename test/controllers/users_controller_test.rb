require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get auth" do
    get users_auth_url
    assert_response :success
  end

  test "should get reg" do
    get users_reg_url
    assert_response :success
  end

end
