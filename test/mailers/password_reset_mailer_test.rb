require 'test_helper'

class PasswordResetMailerTest < ActionMailer::TestCase
  test "password reset created" do
    user = create(:user)
    user.generate_password_reset_token!

    params = { user: user }
    email = PasswordResetMailer.with(params).password_reset_created

    assert_emails 1 do
      email.deliver_later
    end

    assert_equal ['from@example.com'], email.from
    assert_equal [user.email], email.to
    assert_equal 'Reset Password', email.subject
    assert email.body.to_s.include?("/password_resets/#{user.password_reset_token}/edit?email=#{user.email.gsub('@', '%40')}")
  end
end
