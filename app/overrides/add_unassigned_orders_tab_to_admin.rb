# Deface::Override.new(:virtual_path => "spree/admin/shared/_menu",
#     :name => "admin_tab_unassigned_orders",
#     :insert_top => "[data-hook='admin_tabs']",
#     :text => "<%= tab :new_orders, match_path: '/unassigned', :url => '/admin/unassigned' + '?show_only_unprocessed=1', :icon => 'icon-th-large' %>",
#     :disabled => false)