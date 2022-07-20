class Admin::DashboardController < ApplicationController
  before_action :check_user_login
  layout "admin"

  def index
  end
end
