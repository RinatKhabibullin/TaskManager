class Admin::ApplicationController < ApplicationController
  include AuthHelper
  before_action :authenticate_user!, :authorize
  helper_method :current_user

  def authorize
    render(:file => File.join(Rails.root, 'public/403.html'), :status => 403, :layout => false) if (forbidden?)
  end

  def forbidden?
    !current_user.is_a?(Admin)
  end

  def index
    @q = User.ransack(params[:q])
    @users = @q.result.order(:type).order(:id).page(params[:page]).per(10)
  end
end