class PasswordResetMailer < ApplicationMailer
  def password_reset_created
    user = params[:user]
    @token = user.password_reset_token
    @email = user.email

    mail(to: user.email, subject: 'Reset Password')
  end
end