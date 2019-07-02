# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( logo.png )
Rails.application.config.assets.precompile += %w( tinymce-jquery.js )
Rails.application.config.assets.precompile += %w( ckeditor/*)

Rails.application.config.assets.precompile += %w( assets/javascript/ckeditor/init.js)
Rails.application.config.assets.precompile += %w( spree/frontend/ckeditor/init.js )
Rails.application.config.assets.precompile += %w( spree/frontend/mobile/* )
Rails.application.config.assets.precompile += %w( spree/frontend/indecor/* )
Rails.application.config.assets.precompile += %w( public/img/* )
Rails.application.config.assets.precompile += %w( assets/images/indecor/* )
Rails.application.config.assets.precompile += %w( assets/images/cozastore/* )
Rails.application.config.assets.precompile += %w( spree/frontend/cozastore/* )
Rails.application.config.assets.precompile += %w( assets/* )
Rails.application.config.assets.precompile += %w( icon-d.svg )
Rails.application.config.assets.precompile += %w( icon-c.svg )
Rails.application.config.assets.precompile += %w( icon-b.svg )
Rails.application.config.assets.precompile += %w( icon-a.svg )