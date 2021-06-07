require "test_helper"

class MicropostTest < ActiveSupport::TestCase
  def setup
  @user=users(:anna)
  @micropost=@user.microposts.build(content: "lorem ipsum")
  end
  test 'should be valid' do
    assert @micropost.valid?
  end
  test 'id shold be present' do
    @micropost.user_id = nil
    assert_not @micropost.valid?
  end
  test 'content should be present' do
    @micropost.content = "  "
    assert_not @micropost.valid?
  end
  test 'micropost length limit' do
    @micropost.content="a" * 141
    assert_not @micropost.valid?
  end
  test 'order must be most recent first' do
    assert_equal microposts(:most_recent), Micropost.first
  end
end

