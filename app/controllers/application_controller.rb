class ApplicationController < ActionController::Base
  include AdminsHelper
  add_flash_types :success, :error
  end
