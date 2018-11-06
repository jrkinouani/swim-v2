require 'test_helper'

class AquaparcoursControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get aquaparcours_index_url
    assert_response :success
  end

  test "should get show" do
    get aquaparcours_show_url
    assert_response :success
  end

end
