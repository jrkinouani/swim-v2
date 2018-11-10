require 'test_helper'

class EcolesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ecoles_index_url
    assert_response :success
  end

  test "should get show" do
    get ecoles_show_url
    assert_response :success
  end

end
