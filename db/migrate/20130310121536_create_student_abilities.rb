class CreateStudentAbilities < ActiveRecord::Migration
  def change
    create_table :student_abilities do |t|

      t.timestamps
    end
  end
end
