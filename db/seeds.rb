
require 'bcrypt'

# User.create(name: 'bob', password: 'fox')

# Game.create(score: '12', user_id: '1')

# Image.create(url: 'https://c1.staticflickr.com/5/4039/4628932927_20d8d0e937.jpg', city_name: 'San Francisco')

# Image.create(url: 'https://c2.staticflickr.com/6/5131/5480505233_2750b763a0_n.jpg
# ', city_name: 'San Francisco')



def get_city_names
  city_name_array = []
  File.readlines('city_list.txt').each do |line|
    city_name_array << line.gsub(/\d{1,2}.\s{3}/, '').gsup(/\s\(.{1,20}\)/, '').split(", ").first
  end
  return city_name_array
end

def get_urls
  @city_list = get_city_names
  @city_list.each do |city|
    Scraper.new(city).scrape_search_page.each do |img_url|
      Image.new( url: img_url, city_name: city)
      sleep(10)
    end
  end
end

get_urls

