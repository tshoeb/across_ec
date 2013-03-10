class AddUniversityIdToRegistrar < ActiveRecord::Migration
  def change
    add_column :registrars, :university_id, :integer
  end
end
