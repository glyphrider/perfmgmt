class ChangeDirectReportsToAddHierarchy < ActiveRecord::Migration[5.0]
  def change
    change_table :direct_reports do |t|
      t.integer :supervisor_id, null: true
      t.string  :github_id, null: true
    end
  end
end
