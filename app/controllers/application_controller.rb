class ApplicationController < ActionController::Base

  before_action :set_matches
  before_action :set_disgusts
  before_action :visitor_user

  helper_method :current_user
  def current_user
    # @current_user ||= User.find(session[:user_id].to_i) if session[:user_id]
  end


  def set_matches
    session[:matches] ||= Hash.new(0)
    @matches ||= Matches.new(session[:matches])
  end

  def set_disgusts
    # this will eventually be stored,
    # so shouldn't botther to run unless current_user
    session[:disgusts] ||= Hash.new(0)
    @disgusts ||= Disgusts.new(session[:disgusts])
  end

  helper_method :visitor_user
  def visitor_user
    if !current_user
      session[:visitor] ||= Hash.new(0)
      @visitor ||= Visitor.new(session[:visitor])
    end
  end

  helper_method :is_visitor?
  def is_visitor?
    @visitor && @visitor.location
  end


  # def destroy_visitor
  #   session[:visitor] = nil if current_user
  # end

end
