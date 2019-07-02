Deface::Override.new(:virtual_path => 'spree/admin/products/_form',
                     :name => 'add_before_sale_price_to_product_edit',
                     :insert_after => "erb[loud]:contains('text_field :price')",
                     :text => "
    <%= f.field_container :before_sale_price do %>
      <%= f.label Spree.t(:before_sale_price) %>
      <%= f.text_field :before_sale_price %>
      <%= f.error_message_on :before_sale_price %>
    <% end %>
  ")

#Deface::Override.new(
#    :virtual_path => 'spree/admin/products/_form',
#    :name => 'change_price_label',
#    :replace => "erb[loud]:contains('label :price')",
#    :text => "Sale price (*)"
#)