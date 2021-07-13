class SendTaskDestroyNotificationJob < ApplicationJob
  sidekiq_options queue: :mailers
  sidekiq_throttle_as :mailer

  def perform(task_id, author_id)
    author = User.find_by(id: author_id)
    return if author.blank?

    UserMailer.with({ task_id: task_id, author: author }).task_destroyed.deliver_now
  end
end
