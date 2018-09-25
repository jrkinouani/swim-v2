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

  test "should get natation-petit" do
    get pages_natation-petit_url
    assert_response :success
  end

  test "should get natation-moyen" do
    get pages_natation-moyen_url
    assert_response :success
  end

  test "should get natation-adulte" do
    get pages_natation-adulte_url
    assert_response :success
  end

  test "should get bebe-nageur" do
    get pages_bebe-nageur_url
    assert_response :success
  end

  test "should get jardin-aquatique" do
    get pages_jardin-aquatique_url
    assert_response :success
  end

  test "should get mentions" do
    get pages_mentions_url
    assert_response :success
  end

end
