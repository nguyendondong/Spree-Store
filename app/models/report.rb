class Report < ActiveRecord::Base
    
    has_many :products
    has_many :orders
    enum type_report: [:day,:hours]
    serialize :content, Array
    serialize :count_on_hand, Hash
    serialize :hours_report,Hash
    
    def date_report
        case type_report
        when 0
            self.time_report.to_date
        when 1
            self.time_report.to_time.strftime("%H:%M")
        else
            self.time_report.to_date
        end
        
    end
end
