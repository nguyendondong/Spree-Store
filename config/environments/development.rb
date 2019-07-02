Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = true

  
  config.cache_store = :memory_store, { size: 64.megabytes }
  config.action_controller.perform_caching = true

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  # config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true
  config.facebook = {:fb_token => "CAAWIootdtsUBADPaJpMKcc9ZBpNJmSr3yg9LZBv8RAPj45ZAdKV6hKS9t5sIzyPZCgZAeZAIWvPWz0TdJvVwcaZBJvdWgrsx9kD7pqIDhcB2hBzZAYF6dOpEtDVzxCHPVGVFtNrXuCeHKF4H6tIZC4cfCCuGnC83fvLmpnGUjWKOozHcKjdz6QUE0SqYZCfhUTGmEZD",
                    :fb_page_id => "249467635263830",
                    :app_id => "1557606587807429",
                    :app_secret => "905b4bb3b5a4fafd83482be21a87d80b"}
  config.domain = "Indecor.com"
end
