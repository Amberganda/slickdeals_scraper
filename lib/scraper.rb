require 'nokogiri'
require 'open-uri'


class Scraper
    def get_page
        Nokogiri::HTML(open("https://slickdeals.net/"))

    end

    def deals
        self.get_page.css(".fpGridBox")
    end
end
