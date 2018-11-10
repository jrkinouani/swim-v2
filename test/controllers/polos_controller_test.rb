require 'test_helper'

class PolosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get polos_index_url
    assert_response :success
  end

  test "should get show" do
    get polos_show_url
    assert_response :success
  end

end
