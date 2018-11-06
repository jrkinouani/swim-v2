require 'test_helper'

class AquaboxingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get aquaboxings_index_url
    assert_response :success
  end

  test "should get show" do
    get aquaboxings_show_url
    assert_response :success
  end

end
