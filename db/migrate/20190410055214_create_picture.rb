class CreatePicture < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.references :lead, index: true
    end
  end
end
