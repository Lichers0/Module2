require 'test_helper'

class BadgeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get badge_index_url
    assert_response :success
  end

end
