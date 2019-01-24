class CreateDirectReports < ActiveRecord::Migration[5.0]
  def change
    create_table :direct_reports do |t|
      t.string :name

      t.timestamps
    end
  end
end
