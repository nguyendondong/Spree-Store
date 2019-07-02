Spree::VolumePrice.class_eval do
    attr_accessor :range_start, :range_end
    
    def range_start
        range.to_s.gsub(/\(|\)/, "").gsub("..", ",").split(",")[0].to_i
    end

    def range_end
        range.to_s.gsub(/\(|\)/, "").gsub("..", ",").split(",")[1].to_i
    end

    def price_in(currency)
        Spree::Price.new( currency: currency, amount: self.amount)
    end
end
