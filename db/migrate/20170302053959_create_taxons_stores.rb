class CreateTaxonsStores < ActiveRecord::Migration
  def change
    create_table :spree_taxons_stores, id: false do |t|
      t.references :taxon
      t.references :store
    end
  end
end
