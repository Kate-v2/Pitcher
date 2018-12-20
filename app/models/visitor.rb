# require "app/objects/anyone"

class Visitor
  include Anyone

  attr_accessor :location,
                :radius

  def initialize(hash)
    @location = hash['location']
    @radius   = hash['radius']
  end

end
