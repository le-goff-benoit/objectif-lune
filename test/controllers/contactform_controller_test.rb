require "test_helper"

class ContactformControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get contactform_show_url
    assert_response :success
  end

  test "should get create" do
    get contactform_create_url
    assert_response :success
  end
end
