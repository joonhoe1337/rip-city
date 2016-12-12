require 'test_helper'

class NavbarControllerTest < ActionDispatch::IntegrationTest
  test "should get Home" do
    get navbar_Home_url
    assert_response :success
  end

  test "should get About" do
    get navbar_About_url
    assert_response :success
  end

  test "should get Contact" do
    get navbar_Contact_url
    assert_response :success
  end

end
