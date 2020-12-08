require 'test_helper'

class NinjaControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get ninja_create_url
    assert_response :success
  end

end
