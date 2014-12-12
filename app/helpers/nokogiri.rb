class Scraper


  def initialize(location)
    @page = Nokogiri::HTML(open(link_generator(location)))
    @links = []
  end

  def scrape_search_page
    @elements = page.css("a[class='ui-display-link']")
    n = 0

    until n == 10
      @links << "https:" + @elements[n].children[1].attributes['src'].value
      n +=1
    end
    return @links
  end

  private

  def link_generator(city)
    "https://www.flickr.com/search?sort=relevance&text=" + city.gsub(" ", "%20")
  end


end
