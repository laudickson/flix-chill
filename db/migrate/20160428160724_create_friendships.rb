class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.integer :giver_id
      t.integer :reciever_id
      t.timestamps
    end

    add_index :friendships, :giver_id
    add_index :friendships, :reciever_id
  end
end
