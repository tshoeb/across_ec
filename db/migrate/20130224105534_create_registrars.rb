class CreateRegistrars < ActiveRecord::Migration
  def change
    create_table :registrars do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :phone
      t.integer :schedule_id

      t.timestamps
    end
  end
end
