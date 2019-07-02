class AddIdTemplateToSpreeStores < ActiveRecord::Migration
  def change
    add_column :spree_stores, :template_id, :integer
  end
end
