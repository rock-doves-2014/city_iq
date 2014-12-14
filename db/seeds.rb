
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
