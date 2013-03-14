class RemoveScheduleIdFromRegistrar < ActiveRecord::Migration
  def up
    remove_column :registrars, :schedule_id
  end

  def down
    add_column :registrars, :schedule_id, :integer
  end
end
