class ImagesController < ApplicationController

  def index
    @image_facade = ImageFacade.new
  end

end
