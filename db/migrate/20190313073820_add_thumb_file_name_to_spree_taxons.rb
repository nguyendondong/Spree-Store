class AddThumbFileNameToSpreeTaxons < ActiveRecord::Migration
  def change
    add_column :spree_taxons, :thumb_file_name, :string
    add_column :spree_taxons, :thumb_content_type, :string  
    add_column :spree_taxons, :thumb_file_size, :integer  
    add_column :spree_taxons, :thumb_updated_at, :datetime
  end
end
