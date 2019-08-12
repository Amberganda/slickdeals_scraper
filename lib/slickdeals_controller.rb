
class SlickdealsController

    def call
        scraper = Scraper.new
        deals = scraper.deals
        puts deals
        
    end

end
