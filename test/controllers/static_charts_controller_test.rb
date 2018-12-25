require 'test_helper'

class StaticChartsControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_charts_home_url
    assert_response :success
  end

  test "should get help" do
    get static_charts_help_url
    assert_response :success
  end

end
