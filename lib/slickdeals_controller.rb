
class SlickdealsController

    def call
        scraper = Scraper.new
        # deals = scraper.deals
        scraper.make_deals
        
    end

end
