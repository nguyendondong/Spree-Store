class AddTemplateToStore < ActiveRecord::Migration
  def change
    add_column :spree_stores, :template, :string
  end
end
