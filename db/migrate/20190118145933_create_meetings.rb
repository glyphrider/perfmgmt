class CreateMeetings < ActiveRecord::Migration[5.0]
  def change
    create_table :meetings do |t|
      t.integer :direct_report_id
      t.datetime :time
      t.text :notes

      t.timestamps
    end
  end
end
