class AddPasswordDigestToRegistrar < ActiveRecord::Migration
  def change
    add_column :registrars, :password_digest, :string
  end
end
