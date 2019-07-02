module Spree
  module Admin
    GeneralSettingsController.class_eval do
      def edit
        @preferences_security = [:allow_ssl_in_production,
                                 :allow_ssl_in_staging, :allow_ssl_in_development_and_test,
                                 :check_for_spree_alerts]
        @preferences_currency = [:display_currency, :hide_cents]

        @preferences_custom = [:customer_care, :accessible_ips]
      end
    end
  end
end