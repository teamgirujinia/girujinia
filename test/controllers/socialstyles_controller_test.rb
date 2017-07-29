require 'test_helper'

class SocialstylesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get socialstyles_index_url
    assert_response :success
  end

  test "should get show" do
    get socialstyles_show_url
    assert_response :success
  end

end
