require "test_helper"

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
  @user=users(:anna)
  end

  test 'unsuccessful edit' do
    log_in_as(@user)
    get edit_user_path(@user)#template is shown after visiting the page 
    assert_template 'users/edit'
    patch user_path(@user), params: {user: {name:'', #sending wrong data to form to 
                                         email:'foo@invalid', 
                                         password:'foo', 
                                         password_confirmation: 'bar'}}
    assert_template 'users/edit'#template is shown again after sending invalid data
  end

  test 'successful edit' do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    name='Foo Bar'
    email='foo@bar.com'
    patch user_path(@user), params:{user:{#valid information
                                   name: name,
                                   email: email,
                                   password: '',
                                   password_confirmation:''}}
    assert_not flash.empty?#flash is not empty => flash[:succces]='profile updated'
    assert_redirected_to @user# redirection to profile page => redirect_to @user
    @user.reload#returns new user info only if saved
    assert_equal name, @user.name
    assert_equal email, @user.email
  end
  test 'successful edit with friendly forwarding' do
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_path(@user)
    name='Foo Bar'
    email='foo@bar.com'
    patch user_path(@user), params:{user:{#valid information
                                   name: name,
                                   email: email,
                                   password: '',
                                   password_confirmation:''}}
    assert_not flash.empty?#flash is not empty => flash[:succces]='profile updated'
    assert_redirected_to @user# redirection to profile page => redirect_to @user
    @user.reload#returns new user info only if saved
    assert_equal name, @user.name
    assert_equal email, @user.email
  end
end
