class SendPasswordResetCreateNotificationJob < ApplicationJob
  sidekiq_options queue: :mailers
  sidekiq_throttle_as :mailer

  def perform(user_id, token)
    user = User.find_by(id: user_id)
    return if user.blank?

    PasswordResetMailer.with({ user: user, token: token }).password_reset_created.deliver_now
  end
end