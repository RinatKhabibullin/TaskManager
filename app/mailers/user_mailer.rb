class UserMailer < ApplicationMailer
  default from: 'noreply@taskmanager.com', subject: 'New Task Created'
  
  def task_created    
    @task = params[:task]
    user = params[:user]

    mail(to: user.email)
  end
end