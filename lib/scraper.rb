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
            if title.nil? || title.strip.empty?
                next
            end
            puts title.strip

        

            merchant = node.css("a.itemStore").text
            # puts merchant

            raw_price = node.css("div.itemPrice").text.strip
            matches = raw_price.match(/\$(\d*\.?\d{0,2})/)
            if matches != nil
                price = matches[1].to_f
                # puts "price #{price}" 
            end

            matches = raw_price.match(/(.*\$\d*\.?\d{0,2})/)
            if matches != nil
                price_description = matches[1]
                # puts "price description #{price_description}"
            end

            rating = node.css("span.likesLabel").text.strip
            # puts "rating #{rating}"

            # puts " "

            deal = Deal.new
            deal.title = title
            deal.merchant = merchant
            deal.price = price
            deal.price_description = price_description
            deal.rating = rating


        end

    end


            

  
end

#.*\$\d*\.?\d{0,2} this will match a string description
#\$\d*\.?\d{0,2} matches $xx.xx numeric