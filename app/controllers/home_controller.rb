class HomeController < ApplicationController
	before_filter :auth_user

  def auth_user
    redirect_to new_user_session_url unless user_signed_in?
    redirect_to newunit_url  if user_signed_in?
  end

  def index

  end
end
