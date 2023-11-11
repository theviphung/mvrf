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

end
