# require "app/facades/image_facade"

class ImagesController < ApplicationController

  def index
    user = ( current_user || visitor_user )
    @image_facade = ImageFacade.new(user)
  end

end
