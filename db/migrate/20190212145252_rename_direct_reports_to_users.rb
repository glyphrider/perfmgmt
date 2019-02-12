class RenameDirectReportsToUsers < ActiveRecord::Migration[5.0]
  def change
    rename_table :direct_reports, :users
  end
end
