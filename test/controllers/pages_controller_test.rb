require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get pages_home_url
    assert_response :success
  end

  test "should get aquabike" do
    get pages_aquabike_url
    assert_response :success
  end

  test "should get fitness" do
    get pages_fitness_url
    assert_response :success
  end

  test "should get petit" do
    get pages_petit_url
    assert_response :success
  end

  test "should get moyen" do
    get pages_moyen_url
    assert_response :success
  end

  test "should get adulte" do
    get pages_adulte_url
    assert_response :success
  end

  test "should get bebe" do
    get pages_bebe_url
    assert_response :success
  end

  test "should get mention" do
    get pages_mention_url
    assert_response :success
  end

  test "should get jardin" do
    get pages_jardin_url
    assert_response :success
  end

  test "should get staticswims" do
    get pages_staticswims_url
    assert_response :success
  end

end
