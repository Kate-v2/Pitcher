class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :main_address

  def authenticate
  	redirect_to '/' unless user_signed_in?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_signed_in?
    !!current_user
  end

  # def four_oh_four
  #   raise ActionController::RoutingError.new('Not Found')
  # end

end
