class UserMailer < ApplicationMailer
  default from: 'noreply@taskmanager.com'
  
  def task_created    
    @task = params[:task]
    user = params[:user]

    mail(to: user.email, subject: 'New Task Created')
  end

  def task_updated    
    @task = params[:task]
    user = @task.author

    mail(to: user.email, subject: 'Task was changed')
  end

  def task_destroyed    
    @task = params[:task]
    user = @task.author

    mail(to: user.email, subject: 'Task was deleted')
  end
end