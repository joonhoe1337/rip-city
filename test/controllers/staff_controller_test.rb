require 'test_helper'

class StaffControllerTest < ActionDispatch::IntegrationTest
  test "should get sign-up" do
    get staff_sign-up_url
    assert_response :success
  end

  test "should get login" do
    get staff_login_url
    assert_response :success
  end

  test "should get check-in" do
    get staff_check-in_url
    assert_response :success
  end

  test "should get check-out" do
    get staff_check-out_url
    assert_response :success
  end

  test "should get payment" do
    get staff_payment_url
    assert_response :success
  end

end
