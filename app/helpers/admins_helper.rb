module AdminsHelper
  #Return the current logged in admin
  def current_admin
    if @current_admin.nil?
      @current_admin = Admin.find_by(id: session[:admin_id])
    else
      @current_admin
    end
  end

  #Return true if admin is logged in. False otherwise
  def admin_logged_in?
    !session[:admin_id].nil?
  end

  #Log out of current admin
  def admin_log_out
    session.delete(:admin_id)
    @current_admin = nil
  end

end
