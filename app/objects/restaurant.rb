#require 'app/objects/local_restaurant'

# I'm unsure I like this dependency
class Restaurant < LocalRestaurant

  attr_reader :photos

  def initialize(data)
    super
    @photos = data[:photos]
  end

  def use_a_photo
    @photos.shuffle!.pop
  end

end


# {
#     "id": "Mq7kMvY4y5Vhzn6u4am62Q",
#     "alias": "los-carboncitos-denver-2",
#     "name": "Los Carboncitos",
#     "image_url": "https://s3-media3.fl.yelpcdn.com/bphoto/3Wm-QlpSd6yuu5L9_1ZlgQ/o.jpg",
#     "is_claimed": true,
#     "is_closed": false,
#     "url": "https://www.yelp.com/biz/los-carboncitos-denver-2?adjust_creative=87PBg7bGZgP_uA1xaaYqzw&utm_campaign=yelp_api_v3&utm_medium=api_v3_business_lookup&utm_source=87PBg7bGZgP_uA1xaaYqzw",
#     "phone": "+13035731617",
#     "display_phone": "(303) 573-1617",
#     "review_count": 219,
#     "categories": [
#         {
#             "alias": "mexican",
#             "title": "Mexican"
#         },
#         {
#             "alias": "desserts",
#             "title": "Desserts"
#         },
#         {
#             "alias": "seafood",
#             "title": "Seafood"
#         }
#     ],
#     "rating": 4.5,
#     "location": {
#         "address1": "722 Sheridan Blvd",
#         "address2": "",
#         "address3": "",
#         "city": "Denver",
#         "zip_code": "80214",
#         "country": "US",
#         "state": "CO",
#         "display_address": [
#             "722 Sheridan Blvd",
#             "Denver, CO 80214"
#         ],
#         "cross_streets": ""
#     },
#     "coordinates": {
#         "latitude": 39.7284140185014,
#         "longitude": -105.052255
#     },
#     "photos": [
#         "https://s3-media3.fl.yelpcdn.com/bphoto/3Wm-QlpSd6yuu5L9_1ZlgQ/o.jpg",
#         "https://s3-media3.fl.yelpcdn.com/bphoto/NzeuQjvlqlPHc6j4bC4hmA/o.jpg",
#         "https://s3-media3.fl.yelpcdn.com/bphoto/QXjD6wosRLxWDfH2rJAI8Q/o.jpg"
#     ],
#     "price": "$",
#     "hours": [
#         {
#             "open": [
#                 {
#                     "is_overnight": false,
#                     "start": "0900",
#                     "end": "2300",
#                     "day": 0
#                 },
#                 {
#                     "is_overnight": false,
#                     "start": "0900",
#                     "end": "2300",
#                     "day": 1
#                 },
#                 {
#                     "is_overnight": false,
#                     "start": "0900",
#                     "end": "2300",
#                     "day": 2
#                 },
#                 {
#                     "is_overnight": true,
#                     "start": "0900",
#                     "end": "0130",
#                     "day": 3
#                 },
#                 {
#                     "is_overnight": true,
#                     "start": "0900",
#                     "end": "0130",
#                     "day": 4
#                 },
#                 {
#                     "is_overnight": false,
#                     "start": "0900",
#                     "end": "0000",
#                     "day": 5
#                 },
#                 {
#                     "is_overnight": false,
#                     "start": "0900",
#                     "end": "2300",
#                     "day": 6
#                 }
#             ],
#             "hours_type": "REGULAR",
#             "is_open_now": true
#         }
#     ],
#     "transactions": []
# }
