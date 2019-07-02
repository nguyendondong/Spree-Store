class SaleAbility
  include CanCan::Ability
  def initialize(user)
    allow_ips = Spree::Config[:accessible_ips].split(",")
    if user.respond_to?(:has_spree_role?) && user.has_spree_role?('sales_rep') && (allow_ips.blank? || allow_ips.include?(user.current_sign_in_ip))
      can [:manage], Spree::Order
      can [:admin, :index, :show, :edit, :update, :create, :destroy], Spree::Adjustment
      can [:manage], Spree::LineItem
      can [:admin, :index, :show, :edit, :update, :create], Spree::Shipment
      can [:admin, :index, :show, :edit, :update, :create, :fire], Spree::Payment
      can [:admin, :index, :show, :edit, :update, :create, :destroy], Spree::Product
      can [:manage], Spree::Variant
      can [:admin, :index, :show, :edit, :update, :create, :destroy], Spree::Image
      can [:admin, :index, :show, :edit, :update, :create], Spree::OptionType
      can [:admin, :index, :show, :edit, :update, :create], Spree::OptionValue
      can [:admin, :index, :show, :edit, :update, :create, :fire], Spree::ReturnAuthorization
      can [:admin, :index, :show, :edit, :update, :create], Spree::Comment
      can [:admin, :index, :show, :edit, :update, :create], Spree::Lead
      can [:admin, :index, :show, :edit, :update, :create], Spree::Note
      #can [:index], Spree::SalePerformance
      can [:index, :manage], Spree::SalePerformance
      # Always performed
      can :access, :ckeditor   # needed to access Ckeditor filebrowser

      # Performed checks for actions:
      can [:read, :create, :destroy], Ckeditor::Picture
      can [:read, :create, :destroy], Ckeditor::AttachmentFile

    end
  end
end
