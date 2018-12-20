class MatchesController < ApplicationController

  def index
  end

  def update
    status = params[:like]
    update_method(status)
  end

  def destroy
  end


  private

  # coding without if's -- but these all have to evaluate, poor resources
  def update_method(status)
    {
      "true"   => add_restaurant,
      "false"  => nil,
      "reject" => reject_photo
    }
  end

  def add_restaurant
    sesh = session[:matches][params[:restaurant]]
    sesh ||= 0
    sesh =+  1
  end

  def reject_photo
    sesh = session[:disgusts][params[:restaurant]] = params[:photo]
  end

end
