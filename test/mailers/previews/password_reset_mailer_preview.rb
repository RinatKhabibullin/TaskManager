class PasswordResetMailerPreview < ActionMailer::Preview
  def password_reset_created
    user = User.first
    user.generate_password_reset_token!

    params = { user: user }

    PasswordResetMailer.with(params).password_reset_created
  end
end
