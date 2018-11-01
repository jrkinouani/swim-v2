require 'test_helper'

class StaticswimsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get staticswims_show_url
    assert_response :success
  end

  test "should get index" do
    get staticswims_index_url
    assert_response :success
  end

end
