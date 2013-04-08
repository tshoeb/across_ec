class AddRegistrationConfirmationToStudents < ActiveRecord::Migration
  def change
    add_column :students, :registration_confirmation_token, :string
    add_column :students, :registration_confirmation_sent_at, :datetime
  end
end
