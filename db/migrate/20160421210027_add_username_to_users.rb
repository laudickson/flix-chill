class AddUsernameToUsers < ActiveRecord::Migration
  def up
    add_column :users, :username, :string, null: false
  end

  def down
    remove_column :users, :username, :string, null: true
  end
end
