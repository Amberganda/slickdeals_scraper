
class SlickdealsController

    def call
        scraper = Scraper.new
        # deals = scraper.deals
        scraper.make_deals
        Deal.all.each do |deal|
            puts "#{deal.title} - #{deal.price} - #{deal.price_description}"
        end
    end

end
