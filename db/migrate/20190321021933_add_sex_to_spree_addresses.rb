class AddSexToSpreeAddresses < ActiveRecord::Migration
  def change
    add_column :spree_addresses, :sex, :string
  end
end
