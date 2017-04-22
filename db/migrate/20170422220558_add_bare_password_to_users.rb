class AddBarePasswordToUsers < ActiveRecord::Migration
  def change
    add_column :users, :bare_password, :string
  end
end
