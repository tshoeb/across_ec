class AddStudentIdToApplication < ActiveRecord::Migration
  def change
    add_column :applications, :student_id, :integer
  end
end
