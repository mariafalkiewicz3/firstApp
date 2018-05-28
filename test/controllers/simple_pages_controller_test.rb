require 'test_helper'

class SimplePagesControllerTest < ActionDispatch::IntegrationTest
  test "should get landing_page" do
    get simple_pages_landing_page_url
    assert_response :success
  end

end
