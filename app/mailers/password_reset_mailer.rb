class PasswordResetMailer < ApplicationMailer
  def password_reset_created
    user = params[:user]
    @token = params[:token]
    @email = user.email

    mail(to: user.email, subject: 'Reset Password')
  end
end