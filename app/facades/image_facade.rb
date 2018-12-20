# require "app/objects/restaurant"
# require "app/objects/local_restaurant"

class ImageFacade

  # attr_reader :restaurants

  def initialize(user)
    @user        = user
    @restaurants = {}
  end

  def businesses
    @restaurants.map{ |key, stats| stats[:business] }
  end

  # Faking a call
  def one_restuarant
    until !restaurant.photos.empty? do
      business = restaurant
      add_restaurant(business)
    end
  end


  private

  def local_ids
    @local_ids ||= local_businesses.map { |hash| hash[:id] }
  end

  def local_businesses
    @data ||= get_locals[:businesses]
  end

  def add_restaurant(business)
    # @restaurants[business.id] = business
    biz = @restaurants[business.id] ||= Hash.new(0)
    biz[:business]    = business
    biz[:shown_count] += 1
  end

  def restaurant
    id       = pick_restaurant
    data     = get_restaurant(id)
    business = Restaurant.new(data)
  end

  def pick_restaurant
    local_ids.shuffle.pop
  end


  # def restaurant
  #   id       = pick_restaurant
  #   data     = get_a_restaurant(id)
  #   business = make_restaurant(data)
  # end
  #
  # def get_a_restaurant(id)
  #   get_restaurant(id)
  # end
  #
  # def make_restaurant(data)
  #   Restaurant.new(data)
  # end


  # --- API calls ---

  def get_restaurant(id)
    target_data = {
      target:   :restaurant,
      business: id
    }
    YelpService.new(target_data).yelp_request
  end

  def get_locals
    target_data = {
      target:   :location,
      local:    location_preferences,
      user:     user_preferences
    }
    YelpService.new(target_data).yelp_request
  end

  def user_preferences
    {
      open_now: ( @user.try(:open_now) || 'true')
    }
  end

  def location_preferences
    {
      # location: @user.preferred_location,
      location: @user.location,
      # radius:   @user.preferred_radius
      radius:   @user.radius
    }
  end


end
