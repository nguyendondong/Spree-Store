class ManagerAbility
  include CanCan::Ability
  def initialize(user)
    if user.respond_to?(:has_spree_role?) && user.has_spree_role?('manager')

      can [:admin, :manage, :edit, :update, :create], Spree::BlogEntry
      # Always performed
      can :access, :ckeditor   # needed to access Ckeditor filebrowser

      can [:admin, :index, :show, :edit, :update, :create, :destroy], Spree::Product
      # can [:admin, :index, :show], Spree::Order
      can [:admin, :index, :show, :edit, :update, :create, :destroy], Campaign
      can [:admin, :index, :show, :edit, :update, :create, :destroy], Spree::OptionType
      can [:admin, :index, :show, :edit, :update, :create, :destroy], Spree::Variant
      can [:admin, :index, :show, :edit, :update, :create, :destroy], Spree::Image
      can [:admin, :index, :show, :edit, :update, :create], Spree::OptionType
      can [:admin, :index, :show, :edit, :update, :create], Spree::OptionValue

      can [:admin, :index, :show, :edit, :update, :create], Spree::Taxonomy
      can [:admin, :index, :show, :edit, :update, :create], Spree::Taxon

      can [:show], Spree::User

      # Performed checks for actions:
      can [:read, :create, :destroy], Ckeditor::Picture
      can [:read, :create, :destroy], Ckeditor::AttachmentFile

    end
  end
end
