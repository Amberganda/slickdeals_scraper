
class Deal
    
    attr_accessor :title, :merchant, :price, :price_description, :rating

    @@all = []

    def initialize
        @@all << self
    end

    def self.all
        @@all
    end
end