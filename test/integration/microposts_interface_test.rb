require "test_helper"

class MicropostsInterfaceTest < ActionDispatch::IntegrationTest
  def setup
    @user=users(:anna)
  end
  test 'micropost interface' do
  log_in_as(users(:anna))
  get root_path
  assert_select 'div.pagination'
  #send invalid form 
  assert_no_difference 'Micropost.count' do
    post microposts_path, params:{micropost: {content: ''}}
  end
  assert_select 'div#error_explanation'
  #send valid form
  content = "This micropost really ties the room together"
  assert_difference 'Micropost.count', 1 do # check post method
    post microposts_path ,params:{ micropost:{content:content}}
  end
  assert_redirected_to root_url# check going on page
  follow_redirect!# do not follow redirect
  assert_match content, response.body# compare body and content
  #deleting message 
  assert_select 'a', text:'delete'
  first_post=@user.microposts.paginate(page:1).first
  assert_difference 'Micropost.count', -1 do
    delete micropost_path(first_post)
  end
  #check stranger user
  get user_path(users(:archer))
  assert_select 'a', text:'delete', count: 0
end
end
