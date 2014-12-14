require 'bcrypt'

def get_city_names
  city_name_array = []
  file = File.open('./db/city_list.txt') do |f|
    f.each_line do |line|
      city_name_array << line.gsub(/\d{1,2}.\s{3}/, '').gsub(/\s\(.{1,20}\)/, '').split(", ").first
    end
  end
  return city_name_array
end

def get_urls
  @city_list = get_city_names
  @city_list.each do |city|
    CityLinks.new(city).scrape_search_page.each do |img_url|
      Image.new( url: img_url, city_name: city)
    end
    sleep(10)
  end
end

get_urls
