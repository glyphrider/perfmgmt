class ChangeTableMeetingsForeignKeyToUserId < ActiveRecord::Migration[5.0]
  def change
    change_table :meetings do |t|
      t.rename :direct_report_id, :user_id
    end
  end
end
