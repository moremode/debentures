require 'test_helper'

class AjaxControllerTest < ActionDispatch::IntegrationTest
  test "should get username_check" do
    get ajax_username_check_url
    assert_response :success
  end

end
