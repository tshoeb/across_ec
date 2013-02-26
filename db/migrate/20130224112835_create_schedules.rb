class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :file_name
      t.date :date_uploaded
      t.string :schedule
      t.string :semester_year
      t.integer :registrar_id

      t.timestamps
    end
  end
end
