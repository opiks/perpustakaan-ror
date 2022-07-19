class LoginController < ApplicationController
  layout "login"

  def index
  end

  def store
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to home_path, flash: { :message => "Logged in", :type => "success" }
    else
      flash[:message] = "Invalid email or password"
      flash[:type] = "danger"
      render :index
    end
  end

  def forgotpass
  end

  def forgotpassstore
    render plain: params

    @user = User.find_by(email: params[:email])

    if @user.present?
      @token = @user.signed_id(purpose: "password_reset", expires_in: 15.minutes)
      PasswordMailer.with(user: @user, token: @token).reset.deliver_now
      redirect_to home_path, flash: { :message => "We have sent a link to reset your password in email", :type => "success" }
    else
      flash[:message] = "Email is invalid"
      flash[:type] = "danger"
      render :index
    end
  end
end
