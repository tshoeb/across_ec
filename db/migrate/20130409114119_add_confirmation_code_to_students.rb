class AddConfirmationCodeToStudents < ActiveRecord::Migration
  def change
    add_column :students, :confirmation_code, :string
  end
end
