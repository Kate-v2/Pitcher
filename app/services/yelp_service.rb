
class YelpService

  def initialize(filter)
    @filter   = filter
    @base_url = 'https://api.yelp.com/v3/'
    @target   = @filter[:target]
    restrictions
    location
    user_preferences
  end

  def yelp_request
    get_json ( pick_endpoint )
  end


  private

  def restrictions
    @categories = 'food'
    @sort_by    = 'distance'
    @limit      = '20'
  end

  def location
    return nil if !local = @filter[:local]
    @location = local[:location]
    @radius   = local[:radius] || 40000  # radius in meters --> The max value is 40000 meters (about 25 miles).
  end

  def user_preferences
    @open_now = @filter[:open_now]
  end

  def get_json(url)
    response = public_connection.get( url )
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def pick_endpoint
    target_endpoints[ @target ]
  end

  def target_endpoints
    {
      location:   "businesses/search#{find_restaurants}",
      restaurant: "businesses/#{business_id}"
    }
  end

  def find_restaurants
    restriction_params + location_params + user_params
  end

  def restriction_params
    "?categories=#{@categories}" +
    "&sort_by=#{@sort_by}"       +
    "&limit=#{@limit}"
  end

  def location_params
    "&location=#{@location}"     +
    "&radius=#{@radius}"
  end

  def user_params
    "&open_now=#{@open_now}"
  end

  def business_id
    @filter[:business]
  end

  def public_connection
    Faraday.new(url: @base_url) do |f|
      f.headers['Authorization'] = "Bearer #{ENV['yelp_public_token']}"
      f.adapter Faraday.default_adapter
    end
  end

end
