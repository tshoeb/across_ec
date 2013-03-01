class AddAdminToRegistrar < ActiveRecord::Migration
  def change
    add_column :registrars, :admin, :boolean
  end
end
