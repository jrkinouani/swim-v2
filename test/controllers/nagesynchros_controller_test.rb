require 'test_helper'

class NagesynchrosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get nagesynchros_index_url
    assert_response :success
  end

  test "should get show" do
    get nagesynchros_show_url
    assert_response :success
  end

end
