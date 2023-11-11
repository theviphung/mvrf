class AdminsController < ApplicationController
  def new
  end

  def create
    @admin = Admin.find_by(username: params[:username])
    if @admin && @admin.authenticate(params[:password])
      session[:admin_id] = @admin.id
      flash[:notice] = "Logged in succesfully"
      redirect_to admin_dashboard_path
    else
      flash[:alert] = "Invalid email or password"
      redirect_to '/admin-login'
    end
  end

  def destroy
    admin_log_out
    flash[:notice] = "Logged out succesfully"
    redirect_to '/admin-login'
  end
end
