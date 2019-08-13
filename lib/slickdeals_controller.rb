
class SlickdealsController
    
    def call
        puts "Welcome to slickdeals!"
        puts "To list all of our front page deals, enter 'list all'."
        puts "To list only the items (without price), enter 'list deals'."
        puts "Enter 'get item' to get details of a particular item"
        puts "To sort deals by price, enter 'sort by price'."
        puts "To exit, enter 'exit'."

        scraper = Scraper.new
        # deals = scraper.deals
        scraper.make_deals

        while true
            print "Enter a command:\t"
            input = gets

            case input.strip
            when "list all"
                self.list_all
            when "list deals"
                self.list_only_item
            when "get item"
                self.get_item
            when "sort by price"
                self.sort_by_price
            when "exit"
                break
            else
                puts "Did not understand your command. Please try again."
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

    def list_only_item
        Deal.all.each_with_index do |deal, index|
            puts "#{index}. #{deal.title}"
        end
    end

    def get_item
        print "Which item number would you like to get details on?\t"
        index = gets.to_i

        if index >= 0 && index < Deal.all.length
            deal = Deal.all[index]
            puts "#{index}. #{deal.title}   #{deal.price_description}  Merchant: #{deal.merchant}  Rating: #{deal.rating}."
        else 
            puts "Invalid item number. Please try again."
        end


    end

    def sort_by_price
        
        sorted_deals = Deal.all
            .select{|deal| deal.price}
            .sort_by{|deal| deal.price}
        
        sorted_deals.each do |deal|
            puts "#{'%.2f' % deal.price}\t\t#{deal.title}"
        end
    end

end
