require 'bcrypt'
require 'csv'

# def get_city_names
#   city_name_array = []
#   file = File.open('./db/city_list.txt') do |f|
#     f.each_line do |line|
#       city_name_array << line.gsub(/\d{1,3}.\s{2,3}/, '').gsub(/\s\(.{1,20}\)/, '')
#     end
#   end
#   return city_name_array
# end

# def get_urls
#   @city_list = get_city_names
#   CSV.open("saved_data.csv", "w") do |csv|
#     csv << ["url", "city_name"]
#   end
#   @city_list.each do |city|
#     @clean_city_name = city.split(", ").first
#     @city_search_name = city.chomp + " skyline"
#     p @city_search_name
#     CityLinks.new(@city_search_name).scrape_search_page.each do |img_url|
#       CSV.open("saved_data.csv", "a+") do |csv|
#         csv << [img_url, @clean_city_name]
#       end
#     end
#     sleep(3)
#     p "next city"
#   end
# end

# get_urls


CSV.foreach("saved_data.csv") do |row|
  new_row = Image.create( url: row.first.to_s, city_name: row.last.to_s )
  p "new row"
end
p "end"
