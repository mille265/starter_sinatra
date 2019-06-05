# module WikiListOfRiversByContinent
#     class Adapter
#       BASE_URL = 'https://developers.google.com/maps/documentation/'
  
#       attr_reader :continent
  
#       def initialize(continent_name)
#         @continent = Continent.find_or_create_by(name: continent_name)
#       end
  
#       def fetch_rivers
#         rivers = JSON.parse(RestClient.get(river_url))
  
#         rivers['items'].each do |item|
#           river = River.new
#           river.continent_id = continent.id
#           river.name = item['volumeInfo']['title']
#           river.num_countries_pass_through = item['volumeInfo']['description']
  
#           river.save
#         end
#       end
  
#       private
  
#       def continent_url(max_results = 20)
#         "#{BASE_URL}#{continent.continent_sanitizer}&maxResults=#{max_results}"
#       end
  
#     end
#   end
  
  