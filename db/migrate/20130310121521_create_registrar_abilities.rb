class CreateRegistrarAbilities < ActiveRecord::Migration
  def change
    create_table :registrar_abilities do |t|

      t.timestamps
    end
  end
end
