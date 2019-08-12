require 'nokogiri'
require 'open-uri'
require 'htmlentities'



class Scraper
    def get_page
        Nokogiri::HTML(open("https://slickdeals.net/"))

    end

    def deals
        self.get_page.css(".fpGridBox")
    end

    def make_deals
        coder = HTMLEntities.new(:expanded)
        self.deals.each do |node|
            title = node.css("a.itemTitle").text
            title = coder.decode(title)
            puts title.strip
            puts " "

        end

    end


            

  
end
