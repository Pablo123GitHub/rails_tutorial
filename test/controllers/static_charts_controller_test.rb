require 'test_helper'

class StaticChartsControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_charts_home_url
    assert_response :success
    assert_select "title", "Home | Charts Heaven"
  end

  test "should get help" do
    get static_charts_help_url
    assert_response :success
    assert_select "title", "Help | Charts Heaven"
  end

  test "should get about" do
    get static_charts_about_url
    assert_response :success 
    assert_select "title", "About | Charts Heaven"
  end 
end
