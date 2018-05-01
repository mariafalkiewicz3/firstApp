require 'test_helper'

class SimplePagesControllerTest < ActionDispatch::IntegrationTest
  test "should get contact" do
    get simple_pages_contact_url
    assert_response :success
  end

end
