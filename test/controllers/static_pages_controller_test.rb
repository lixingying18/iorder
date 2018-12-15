require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_pages_home_url
    assert_response :success
  end

  test "should get about" do
    get static_pages_about_url
    assert_response :success
  end

  test "should get services" do
    get static_pages_services_url
    assert_response :success
  end

  test "should get menu" do
    get static_pages_menu_url
    assert_response :success
  end

  test "should get root" do
    get static_pages_home_url
    assert_response :success
  end
end
