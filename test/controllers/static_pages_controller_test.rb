require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_pages_home_url#testing Home renderig GET request to action 'home' and have a successful response
    assert_response :success
    assert_select 'title', 'Home| Ror sample app'
  end

  test "should get help" do
    get static_pages_help_url
    assert_response :success
    assert_select 'title', 'Help| Ror sample app'
  end
  test 'should get about' do
    get static_pages_about_url
    assert_response :success
    assert_select 'title', 'About| Ror sample app'
  end
end
