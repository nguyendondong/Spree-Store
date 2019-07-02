class Spree::Lead < Spree::Base
    attr_accessor :email
    belongs_to :user
    has_many :notes, as: :notable
    has_many :orders, :dependent => :destroy
    belongs_to :lead_list, :dependent => :destroy
    belongs_to :state, class_name: 'Spree::State'
    belongs_to :district, class_name: 'Spree::District'
    has_and_belongs_to_many :products, join_table: 'leads_products'
    has_many :pictures
    validates_format_of :phone, :with =>  /\d[0-9]\)*\z/ , :message => "Only positive number without spaces are allowed"

    def images=(files = [])
        files.each do |f|
            pictures.create(image: f)
        end
    end
    # has_attached_file :image
    # validates_attachment :pictures,
                    #  content_type: { content_type: /\Aimage\/.*\z/ },
                    #  size: { less_than: 1.megabyte }
    # after_update :add_to_order

    # private
    # def add_to_order
    #   order = Spree::Order.find_by_number(self.order_number)
    #   order.update_attribute(:lead_id, self.id) if order.present?
    # end
end