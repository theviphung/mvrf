class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_success_path(@user)
    else
      redirect_to user_failure_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def change_info
    @field = params[:field]
    @user_id = params[:user_id]
    @user = User.find(@user_id)
    render 'change-info'
  end

  def modify_info
    @field = params[:field]
    @user_id = params[:user_id]
    @user = User.find(@user_id)
    
    new_value = params[:modify_info][:new_value]

    @user.send("#{@field}=", new_value)

    if @user.save
      redirect_to my_account_path, success: "User information updated successfully."
    else
      render 'change-info', success: "Error modifying"
    end

  end

  def modify_preferences
    @user_id = params[:modify_preferences][:user_id]
    @user = User.find(@user_id)

    preferences_params.each do |preference, value|
      @user.update_attribute(preference, value)
    end

    if @user.save
      redirect_to my_account_path, success: "Dietary preferences updated successfully."
    else
      flash[:notice] = "Error updating dietary preferences."
      render 'change-preferences'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def preferences_params
    params.require(:modify_preferences).permit(
      :gluten_intolerance, :vegan, :vegetarian,
      :nut_allergy, :fish_and_shellfish_allergy,
      :egg_allergy, :soy_allergy, :dairy_allergy,
      :kosher, :halal
    )
  end


end
