class AddRatingToWatchedShows < ActiveRecord::Migration
  def up
    add_column :watchedshows, :rating, :integer, null: false
  end

  def down
    remove_column :watchedshows, :rating
  end
end
