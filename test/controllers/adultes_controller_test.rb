require 'test_helper'

class AdultesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get adultes_show_url
    assert_response :success
  end

  test "should get index" do
    get adultes_index_url
    assert_response :success
  end

end
