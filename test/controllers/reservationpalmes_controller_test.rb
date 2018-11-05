require 'test_helper'

class ReservationpalmesControllerTest < ActionDispatch::IntegrationTest
  test "should get form" do
    get reservationpalmes_form_url
    assert_response :success
  end

  test "should get new" do
    get reservationpalmes_new_url
    assert_response :success
  end

end
