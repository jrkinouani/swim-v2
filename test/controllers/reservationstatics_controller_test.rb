require 'test_helper'

class ReservationstaticsControllerTest < ActionDispatch::IntegrationTest
  test "should get _form" do
    get reservationstatics__form_url
    assert_response :success
  end

  test "should get new" do
    get reservationstatics_new_url
    assert_response :success
  end

  test "should get show" do
    get reservationstatics_show_url
    assert_response :success
  end

  test "should get index" do
    get reservationstatics_index_url
    assert_response :success
  end

end
