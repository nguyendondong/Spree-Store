class AddCountOnHandToReports < ActiveRecord::Migration
  def change
    add_column :reports, :count_on_hand, :string
  end
end
