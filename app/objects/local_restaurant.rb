# Majority of this information can be found in the
# individual Restaurant api-request.
# This object may prove useless or over established

# Perhaps an inheritance would be good?
# -- if either api structure changes, that would cause problems

class LocalRestaurant

  attr_reader :id,
              :name,
              :url,
              :rating,
              :price

  def initialize(data)
    @data = data

    @id   = data[:id]
    @name = data[:name]
    @url  = data[:url]

    @rating = data[:rating]
    @price  = data[:price]
  end


  def categories
    @data[:categories].map { |hash| hash[:title] }
  end

  def address  # Array
    @data[:location][:display_address]
  end

  # Restaurants that inherit from here
  # will not be able to use this method --> nil or error?
  def distance
    @data[:distance]
  end

end


# {
#     "id": "ywFvkNZVJoXUQbZoq7fr1w",
#     "alias": "rioja-denver",
#     "name": "Rioja",
#     "image_url": "https://s3-media1.fl.yelpcdn.com/bphoto/10nJgzsK4Fb_EeoiCGV7nQ/o.jpg",
#     "is_closed": false,
#     "url": "https://www.yelp.com/biz/rioja-denver?adjust_creative=87PBg7bGZgP_uA1xaaYqzw&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_search&utm_source=87PBg7bGZgP_uA1xaaYqzw",
#     "review_count": 1993,
#     "categories": [
#         {
#             "alias": "newamerican",
#             "title": "American (New)"
#         },
#         {
#             "alias": "spanish",
#             "title": "Spanish"
#         },
#         {
#             "alias": "bars",
#             "title": "Bars"
#         }
#     ],
#     "rating": 4.5,
#     "coordinates": {
#         "latitude": 39.7478083125095,
#         "longitude": -104.999331349925
#     },
#     "transactions": [],
#     "price": "$$$",
#     "location": {
#         "address1": "1431 Larimer St",
#         "address2": "",
#         "address3": "",
#         "city": "Denver",
#         "zip_code": "80202",
#         "country": "US",
#         "state": "CO",
#         "display_address": [
#             "1431 Larimer St",
#             "Denver, CO 80202"
#         ]
#     },
#     "phone": "+13038202282",
#     "display_phone": "(303) 820-2282",
#     "distance": 393.7697519531262
# }
