class PasswordMailer < ApplicationMailer
  def reset
    mail to: params[:user].email
  end
end
