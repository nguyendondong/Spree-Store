class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.integer :type_report
      t.text :content
      t.string :sale_report
      t.integer :time_report

      t.timestamps
    end
  end
end
