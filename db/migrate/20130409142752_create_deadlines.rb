class CreateDeadlines < ActiveRecord::Migration
  def change
    create_table :deadlines do |t|
      t.string :semester
      t.date :start_of_registration
      t.date :start_of_classes

      t.timestamps
    end
  end
end
