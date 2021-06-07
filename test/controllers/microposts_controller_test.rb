require "test_helper"

class MicropostsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @micropost=microposts(:orange)
  end
  test 'should redirect create when not logged in' do# POST
  assert_no_difference 'Micropost.count', 'You can not create a post' do
    post microposts_path, params:{micropost: {content: 'Loremp ipsum'}}
  end
    assert_redirected_to login_url
  end
  test 'should redirect destroy when not logged in' do# DELETE
    assert_no_difference 'Micropost.count' do#an attepmt to delete doesn't couse the change of microposts count
      delete micropost_path(@micropost)
    end
    assert_redirected_to login_url
  end
  test 'should redirect destroy for wrong micropost' do
  log_in_as(users(:anna))
  micropost=microposts(:ants)
  assert_no_difference 'Micropost.count' do
    delete micropost_path(micropost)
  end
  assert_redirected_to root_url
  
  end
end
