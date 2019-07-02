class ChangeMetaKeywordToStringForSpreeTaxonTranslations < ActiveRecord::Migration
  def up
    change_column :spree_taxon_translations, :meta_keywords, :text, limit: 4294967295
  end
 
  def down
    change_column :spree_taxon_translations, :meta_keywords
  end
end
