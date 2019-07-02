class Changedatatypeinreports < ActiveRecord::Migration
  def up
    change_column :reports, :count_on_hand, :text, limit: 4294967295
  end
 
  def down
    change_column :reports, :count_on_hand
  end
end
