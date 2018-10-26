require 'test_helper'

class ReservationgymsControllerTest < ActionDispatch::IntegrationTest
  test "should get _form" do
    get reservationgyms__form_url
    assert_response :success
  end

  test "should get edit" do
    get reservationgyms_edit_url
    assert_response :success
  end

  test "should get index" do
    get reservationgyms_index_url
    assert_response :success
  end

  test "should get show" do
    get reservationgyms_show_url
    assert_response :success
  end

  test "should get index" do
    get reservationgyms_index_url
    assert_response :success
  end

end
