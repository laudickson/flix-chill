class CreateChills < ActiveRecord::Migration
  def change
    create_table :chills do |t|
      t.belongs_to :user, null: false
      t.integer :match, null: false
      t.boolean :chill, default: false
    end
  end
end
