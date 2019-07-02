class AddhoursReports < ActiveRecord::Migration
  def change
    add_column :reports, :hours_report, :text
  end
end
