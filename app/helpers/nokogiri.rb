class CityLinks
attr_reader :page, :links

  def initialize(location)
    @page = Nokogiri::HTML(open(link_generator(location)))
    @links = []
    self.scrape_search_page
  end

  def scrape_search_page
    images_wanted = @page.css('a[data-track="photo-click"] img').map { |ele| ele["data-defer-src"]  }
    @links = images_wanted.slice(0..10)
  end

  private

  def link_generator(city)
    "https://www.flickr.com/search?sort=relevance&text=" + city.gsub(" ", "%20")
  end


end

# def scrape_search_page(city)
#   page = Nokogiri::HTML(open("https://www.flickr.com/search?sort=relevance&text=" + city.gsub(" ", "%20"))
#   images_wanted = page.css('a[data-track="photo-click"] img').map { |ele| ele["data-defer-src"]  }
#   images_wanted.slice(0..10)
# end


