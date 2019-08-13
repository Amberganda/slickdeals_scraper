
class SlickdealsController

    def call
        scraper = Scraper.new
        # deals = scraper.deals
        scraper.make_deals

        while true
            input = gets

            case input.strip
            when "list all"
                self.list_all
            when "exit"
                break
            end

        end
        # Deal.all.each do |deal|
        #     puts "#{deal.title} - #{deal.price} - #{deal.price_description}"
        # end
    end

    def list_all
        Deal.all.each_with_index do |deal, index|
            puts "#{index}. #{deal.title} - #{deal.price} - #{deal.price_description}"
        end
        
    end


end
