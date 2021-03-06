require 'HTTParty'

def location(input)

  response = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{input}&key=AIzaSyAQ1O9R0sUpFZovcF_RSclKGYSs4QGS4d0").parsed_response
  location = response["results"][0]["geometry"]["location"]
  return location
end

seven_wonders = ["Great Pyramind of Giza", "Hanging Gardens of Babylon", "Colossus of Rhodes", "Pharos of Alexandria", "Statue of Zeus at Olympia", "Temple of Artemis", "Mausoleum at Halicarnassus"]

output = {}
seven_wonders.each do |wonder|
output["#{wonder}"] = location(wonder)
end
puts output






#Example Output:
#{"Great Pyramind of Giza"=>{"lat"=>29.9792345, "lng"=>31.1342019}, "Hanging Gardens of Babylon"=>{"lat"=>32.5422374, "lng"=>44.42103609999999}, "Colossus of Rhodes"=>{"lat"=>36.45106560000001, "lng"=>28.2258333}, "Pharos of Alexandria"=>{"lat"=>38.7904054, "lng"=>-77.040581}, "Statue of Zeus at Olympia"=>{"lat"=>37.6379375, "lng"=>21.6302601}, "Temple of Artemis"=>{"lat"=>37.9498715, "lng"=>27.3633807}, "Mausoleum at Halicarnassus"=>{"lat"=>37.038132, "lng"=>27.4243849}}
