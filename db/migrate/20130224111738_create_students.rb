class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :student_number
      t.string :mobile
      t.string :major
      t.date :year_of_graduation

      t.timestamps
    end
  end
end
