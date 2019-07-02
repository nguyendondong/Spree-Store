class CreateSpreeBlogEntryTaxons < ActiveRecord::Migration
  def change
    create_table :spree_blog_entry_taxons do |t|
      t.references :blog_entry
      t.references :taxon

      t.timestamps
    end
  end
end
