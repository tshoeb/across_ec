class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.date :application_date
      t.string :course_no
      t.integer :university_id
      t.string :passport_copy
      t.string :sign_form
      t.string :semester_year
      t.integer :registrar_id

      t.timestamps
    end
  end
end
