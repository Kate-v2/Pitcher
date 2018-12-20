
class VisitorsController < ApplicationController

  # def index
  #   redirect_to images_path
  # end

  def create
    session[:visitor][:location] = params[:location]
    session[:visitor][:radius]   = params[:radius]
    redirect_to images_path
  end

  def update
  end

  def destroy
  end

end
