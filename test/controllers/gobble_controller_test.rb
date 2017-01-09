require 'test_helper'

class GobbleControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get gobble_home_url
    assert_response :success
  end

end
