class AddUniversityIdToStudent < ActiveRecord::Migration
  def change
    add_column :students, :university_id, :integer
  end
end
