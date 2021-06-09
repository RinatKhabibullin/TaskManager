class Web::PasswordResetsController < Web::ApplicationController
  def new
    @password_reset = PasswordResetForm.new
  end

  def create
    @password_reset = PasswordResetForm.new(password_reset_params)

    if @password_reset.valid?
      user = @password_reset.user
      user.generate_password_reset_token!
      PasswordResetMailer.with({ user: user }).password_reset_created.deliver_now
    else
      render(:new)
    end
  end

  def edit
    @user = User.find_by(email: params[:email])
    if !@user.password_reset_token_active?
      @user.remove_password_reset_token!
      render file: "#{Rails.root}/public/404.html" , status: :not_found
    end    
    if !@user.token_validation?(params[:id])
      render file: "#{Rails.root}/public/404.html" , status: :not_found
    end
  end

  def update
    @user = User.find_by(email: params[:email])
    if @user.update(user_params)
      @user.remove_password_reset_token!
      redirect_to(:new_session)
    else
      render(:edit)
    end
  end

  private

  def password_reset_params
    params.require(:password_reset_form).permit(:email)
  end

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
