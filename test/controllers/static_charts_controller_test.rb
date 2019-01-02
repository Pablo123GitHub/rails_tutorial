require 'test_helper'

class StaticChartsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = "Charts Heaven"
  end 

  test "should get root" do
    get root_url
    assert_response :success
  end 

  test "should get home" do
    get static_charts_home_url
    assert_response :success
    assert_select "title", "#{@base_title}"
  end

  test "should get help" do
    get static_charts_help_url
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
  end

  test "should get about" do
    get static_charts_about_url
    assert_response :success 
    assert_select "title", "About | #{@base_title}"
  end 

  test "should get contact" do 
    get static_charts_contact_url
    assert_response :success
    assert_select "title", "Contact | #{@base_title}"
  end 
end
