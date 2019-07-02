class ChangeDataTypeInReports < ActiveRecord::Migration
  def up
    change_column :reports, :time_report, :datetime
  end
 
  def down
    change_column :reports, :time_report
  end
end
