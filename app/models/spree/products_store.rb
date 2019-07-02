class Spree::ProductsStore < ActiveRecord::Base
    belongs_to :product, class_name: "Spree::Product"
    belongs_to :store, class_name: "Spree::Store"
end