class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    if session[:user_id]
      Current.user = User.find_by(id: session[:user_id])
    end
  end

  def check_user_login
    if Current.user.nil?
      redirect_to login_path, flash: { :message => "Harus Login Terlebih Dahulu", :type => "danger" }
    end
  end

  def check_user_not_login
    if !Current.user.nil?
      redirect_to admin_dashboard_path, flash: { :message => "Welcome Back", :type => "success" }
    end
  end
end
