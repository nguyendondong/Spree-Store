# Configure Spree Preferences
#
# Note: Initializing preferences available within the Admin will overwrite any changes that were made through the user interface when you restart.
#       If you would like users to be able to update a setting with the Admin it should NOT be set here.
#
# In order to initialize a setting do:
# config.setting_name = 'new value'
Spree.config do |config|
  # Example:
  # Uncomment to stop tracking inventory levels in the application
  # config.track_inventory_levels = false
  config.logo = "logo.jpeg"
  config.address_requires_state = false
  config.allow_backorder_shipping = true
  config.admin_products_per_page = 20
  config.allow_ssl_in_production = false
end
SpreeEditor::Config.tap do |config|
  config.ids = 'product_description page_body event_body  '

  # change the editor to CKEditor
  config.current_editor = 'CKEditor'
end
Spree.user_class = "Spree::User"
Spree::Auth::Config[:registration_step] = false;
Spree::Ability.register_ability(SaleAbility)
Spree::Ability.register_ability(BloggerAbility)
Spree::Ability.register_ability(ManagerAbility)
Spree::PermittedAttributes.address_attributes << :district_id
Spree::PermittedAttributes.address_attributes << :district_name
Spree::PermittedAttributes.address_attributes << :ip
Spree::PermittedAttributes.shipment_attributes << :real_cost
Spree::PermittedAttributes.line_item_attributes << :variant_id
Spree::PermittedAttributes.store_attributes << :social_image_file_name
Rails.application.config.spree.promotions.rules << Spree::Promotion::Rules::ItemCount
Rails.application.config.spree.promotions.rules << Spree::Promotion::Rules::ReturningUser
Spree::PermittedAttributes.product_attributes << :quantity_multiples_product
Spree::PermittedAttributes.product_attributes << :featured_item
Spree::PermittedAttributes.variant_attributes << :volume_prices_attributes
Spree::PermittedAttributes.user_attributes << :avatar
Spree::PermittedAttributes.taxon_attributes << :thumb
Spree::PermittedAttributes.address_attributes << :sex
Spree::PermittedAttributes.product_attributes << :image

