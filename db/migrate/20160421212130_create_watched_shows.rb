class CreateWatchedShows < ActiveRecord::Migration
  def change
    create_table :watchedshows do |t|
      t.belongs_to :user, null: false
      t.belongs_to :tvshow, null: false
    end
  end
end
