require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  test "account_activation" do
    user = users(:anna)
    user.activation_token = User.new_token
    mail = UserMailer.account_activation(user)

    assert_equal "Account activation", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["noreply@example.com"], mail.from
    # check name+activation_token+masked_email in messages body
    assert_match user.name,               mail.text_part.body.to_s.encode("UTF-8")
    assert_match user.activation_token,   mail.text_part.body.to_s.encode("UTF-8")
    assert_match CGI::escape(user.email), mail.text_part.body.to_s.encode("UTF-8") # CGI: to mask user's email
  end

  test "password_reset" do
    mail = UserMailer.password_reset
    assert_equal "Password reset", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["noreply@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
