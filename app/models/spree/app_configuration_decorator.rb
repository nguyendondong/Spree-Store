Spree::AppConfiguration.class_eval do
  preference :customer_care, :string, default: 'Customer'
  preference :accessible_ips, :string, default: '127.0.0.1'
end